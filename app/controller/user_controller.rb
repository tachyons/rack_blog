require './app/model/user_model.rb'
require './app/model/post_model.rb'

load './app/controller/MainController.rb'
class UserController < MainController
	def index
		@users=User.all
		#@user=['hello','hi']
		@current_userid=@session[:user_id];
		render "index"
	end
	def new
		render "new"
	end
	def create
		#@user = User.new(@params)
		#@user.save
		@user = User.new
		@user.username=@params['username']
		@user.password = @params['password']
		@user.save!
		@user.errors.full_messages
	end
	def login
		@user_id=@session[:user_id]
		if @user_id.nil? #|| @user_id.empty?
			render "login"
		else
			return " You are already logged in <a href=\"/user/logout\"> Logout </a>"
		end

	end
	def logout
		if !@session[:user_id].nil?
			@session.delete('user_id')
		end
		return "You are not logged in"
	end
	def login_post
		@user = User.find_by_username(@params['username'])
  		if @user && @user.password == @params['password']
  			@session[:user_id]=@user.id
  			render "success"
  			#puts "success"
  		else
  			render "fail"
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
	end
	def update
	end
	def destroy
		User.destroy(@id)
		"Deleted"
	end
end
