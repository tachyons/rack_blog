require 'erb'
class MainController
	def render(template)
		path=File.expand_path("../views/#{template}.html.erb",__FILE__)
		ERB.new(File.read(path)).result(Binding)
	end
end
