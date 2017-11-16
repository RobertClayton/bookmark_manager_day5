require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'tag'
require_relative 'tagging'

class Link
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :url, String
  # property :tag, String

  #has n, :taggings
  has n, :tags, :through => Resource #:taggings
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
