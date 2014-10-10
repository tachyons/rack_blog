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
    puts env['PATH_INFO']
	
    [200, {'Content-Type' => 'text/html'}, [env['PATH_INFO']]]
  end
end
run MyApp.new
