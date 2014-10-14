
require './app/model/post_model.rb'
load './app/controller/MainController.rb'
class PostController  < MainController
	def initialise(params)
		puts "Main Controller initaliased"
	end
	def index
		@post=Post.all
		render "index"
	end
end
