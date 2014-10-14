
require './app/model/post_model.rb'
load './app/controller/MainController.rb'
class PostController  < MainController
	def index
		@posts=Post.all
		render "index"
	end
	def new
		render "new"
	end
	def create
		@post= Post.new(@params)
		@post.save
	end
end
