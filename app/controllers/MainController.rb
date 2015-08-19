require 'erb'
class MainController
	attr_accessor :session,:status
	def initialize(params,id,session)
		@params=params
		@id=id
		@session = session
		@status=200
	end
	def redirect_to(path)
		@status=301
		return path
	end
	def render(template)
		path=File.expand_path("../../views/layouts/application.html.erb",__FILE__)
		ERB.new(File.read(path)).result(binding)
	end
	def render_view(template)
		path=File.expand_path("../../views/#{self.class.to_s.downcase.sub("controller","")}/#{template}.html.erb",__FILE__)
		ERB.new(File.read(path)).result(binding)
	end

end

