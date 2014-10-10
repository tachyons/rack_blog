require './lib/router.rb'
use Rack::CommonLogger
use Rack::ShowExceptions
use Rack::Lint
use Rack::Static, 
  :urls => ["/media/images", "/media/js", "/media/css"],
  :root => "public"
class MyApp
	def call(env)
		# env has request/response information
		@path= env['PATH_INFO']
		route(@path)
		[200, {'Content-Type' => 'text/html'}, [@responce.inspect]]
	end
	def route(path)
		@responce=get_controllers_list
		
	end
	def get_controllers_list
		return Dir['./app/controller/**.rb']
	end
end
run MyApp.new
