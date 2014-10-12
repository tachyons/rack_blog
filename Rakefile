#require File.expand_path('../config.ru', __FILE__)
require 'mysql'
require 'active_record'
require 'yaml'
require 'active_support'
require 'iconv'
require File.expand_path('../app/config/application', __FILE__)

task :default => :migrate

desc "Run migrations"
task :migrate do
  ActiveRecord::Migrator.migrate('db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
end
