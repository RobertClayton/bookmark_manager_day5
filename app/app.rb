ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'app_helpers'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  enable :secret_sessions, 'secret'

  get '/' do
    erb :'root/sign_in'
  end

  get '/links' do
    @links = Link.all
    @user = current_user
    erb :'links/index'
  end

  post '/add_links' do
    link = Link.create(url: params[:url], title: params[:title])

    assigned_tags = params[:tag].split(' ')
    assigned_tags.each do |split_tag|
      tag = Tag.first_or_create(name: split_tag)
      link.tags << tag
      link.save
    end

    redirect '/links'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links/filter' do
    @filtered_links = Tag.all(name: params[:filter]).links
    erb :'links/filter'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password],
      password_confirmation: params[:password_confirmation])

    unless params[:password_confirmation] == params[:password]
      flash.now[:notice] = "Password and confirmation password do not match"
      erb :'root/sign_in'
    else
      session[:user_id] = user.id
      redirect '/links'
    end
  end
end

# p 'HERE!!!!'
# p split_tag
# p 'END'
