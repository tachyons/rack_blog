dbconfig = YAML::load(File.open('./app/config/database.yml'))
ActiveRecord::Base.establish_connection(dbconfig)
class User < ActiveRecord::Base
	def create
	end
end
