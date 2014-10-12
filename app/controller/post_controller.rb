require './app/model/post_model.rb'
load './app/controller/MainController.rb'
class PostController  < MainController
	def index
		@post=Post.new
		render "index"
	end
end
