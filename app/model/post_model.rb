require 'mysql'
require 'active_record'
require 'yaml'
 
dbconfig = YAML::load(File.open('./app/config/database.yml'))
ActiveRecord::Base.establish_connection(dbconfig)
class Post < ActiveRecord::Base
	def create
	end
end
