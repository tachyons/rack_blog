require './lib/router.rb'
use Rack::CommonLogger
use Rack::ShowExceptions
use Rack::Lint
use Rack::Static, 
  :urls => ["/media/images", "/media/js", "/media/css"],
  :root => "public"
class MyApp
	def self.call(env)
		new(env).response
	end
	def initialize(env)
		@request=Rack::Request.new(env)
	end
	def response()
		# env has request/response information
		@path= @request.path
		@req_method=@request_method
		route(@path,@req_method)
		
		Rack::Response.new(@responce)
		#[200, {'Content-Type' => 'text/html'}, [@responce]]
	end
	def route(path,req_method)
		@responce=""
		@controller_list=get_controllers_list
		case path
		when /^\/$/ 
			@responce+="root"
		when /^\/(\w*)(\/)?$/ 
			@controller="#{$1}"
			if @controller_list.include? @controller
				@responce+="valid"
				@responce=als_load(@controller)
			else
				@responce+=@controller_list.inspect
			end
		when /^\/(\w+)(\/)?(\w+)(\/)?$/
			@controller="#{$1}"
			@action="#{$3}"
			@responce+="two"
			if @controller_list.include? @controller
				@responce=als_load(@controller,@action)
			end
		when /^\/\w*(\/)?\d*(\/)?\w*(\/)?$/
			@controller="#{$1}"
			@action="#{$3}"
			@id="{$2}"
			@responce+="Three"			
		else
			@responce="failure"
		end
		# @responce=path.scan('/\w*/').first.last+req_method;
		
	end
	def als_load(controller,action="index",id=nil)
		require 'mysql'
		require 'active_record'
		require 'yaml'
		 
		dbconfig = YAML::load(File.open('./app/config/database.yml'))
		ActiveRecord::Base.establish_connection(dbconfig)
		controller_file="./app/controller/"+controller+"_controller.rb"
		load controller_file
		class_name=controller.capitalize+"Controller"
		@responce+=class_name;
		ob=class_name.constantize.new
		ob.send(action)
		#@responce=" Action=#{action}"
	end
	def get_controllers_list
		@controller_list=[]
		@list= Dir['./app/controller/**.rb']
		@list.each { |controller|
			@controller_list.push(controller[/\w*\.rb/,0].sub(".rb","").sub("_controller",""))
		}
		return @controller_list
	end
end
run MyApp
