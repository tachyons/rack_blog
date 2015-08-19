require './app/models/user.rb'
require './app/models/post.rb'

load './app/controllers/MainController.rb'
class UsersController < MainController
	def index
		@users=User.all
		@current_userid=@session[:user_id];
		render "index"
	end
	def new
		render "new"
	end
	def create
		@user = User.new(@params)
		@user.save!
		@user.errors.full_messages
		redirect_to "/users/index"
	end
	def login
		@user_id=@session[:user_id]
		if @user_id.nil? #|| @user_id.empty?
			render "login"
		else
			"You are already logged in <a href=\"/post\">Back </a>"
		end
	end
	def logout
		if !@session[:user_id].nil?
			@session.delete('user_id')
		end
		render "login"
	end
	def login_post
		@user = User.find_by_username(@params['username'])
  		if @user && @user.password == @params['password']
  			@session[:user_id]=@user.id
  			redirect_to "/posts/index"
  			#puts "success"
  		else
  			render "login"
  			#puts "Login Error"
  		end
  	#render "success"
	end
	def show
		@user=User.find_by_id(@id)
		@posts=@user.posts
		render "show"
	end
	def edit
		render "edit"
	end
	def update
	end
	def destroy
		User.destroy(@id)
		"Deleted"
		redirect_to "index"
	end
end
