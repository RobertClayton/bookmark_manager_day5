ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/link.rb'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  get '/' do
    erb :'root/index'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  post '/add_links' do
    link = Link.create(url: params[:url], title: params[:title])
    tag  = Tag.first_or_create(name: params[:tag])
    link.tags << tag
    link.save
    redirect '/links'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links/filter' do
    @filtered_links = []
    Link.each { |x| @filtered_links << x if x.tags.map(&:name).include? params[:filter] }
    erb :'links/filter'
  end
end
