#require File.expand_path('../config.ru', __FILE__)
require 'mysql'
require 'active_record'
require 'yaml'
require 'active_support'
require File.expand_path('../app/config/application', __FILE__)

task :default => :migrate

desc "Migrate the database through scripts in db/migrate. Target specific version with VERSION=x"
task :migrate => :environment do
  ActiveRecord::Migrator.migrate('db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil )
end

task :environment do
  ActiveRecord::Base.establish_connection(YAML::load(File.open('app/config/database.yml')))
  ActiveRecord::Base.logger = Logger.new(File.open('log/database.log', 'a'))
end
