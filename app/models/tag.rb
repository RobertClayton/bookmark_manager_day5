require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'link'
require_relative 'tagging'

class Tag
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  # has n, :taggings
  # has n, :links, :through => :taggings
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
