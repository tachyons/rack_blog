
require './app/model/post_model.rb'
require './app/model/user_model.rb'
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
		@user_id=@session[:user_id]
		if @user_id.nil?
			return " Please Login"
		end
		@user = User.find(@user_id)
    	@post = @user.posts.create(@params)

		# @post= Post.new(@params)
		# @post.user_id="0";
		@post.save!
		@post.errors.full_messages
		redirect_to "index"
	end
	def destroy
		@user_id=@session[:user_id]
		@post_user_id=Post.find(@id).user_id
		if @user_id.nil?
			"Please Login <a href=\"/user/login\">Back </a>"
		elsif @user_id != @post_user_id
			"You are not authenticated <a href=\"/post\">Back </a>"
		else
			Post.destroy(@id)
			"Deleted <a href=\"/post\">Back </a>"
		end
		redirect_to "index"
	end
	def show
		@post=Post.find_by_id(@id)
		render "show"
	end
end
