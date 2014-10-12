require 'erb'
class MainController
	def render(template)
		path=File.expand_path("../../view/#{self.class.to_s.downcase.sub("controller","")}/#{template}.html.erb",__FILE__)
		ERB.new(File.read(path)).result(binding)
	end
end
