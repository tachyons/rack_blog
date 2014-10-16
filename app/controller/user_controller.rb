require './app/model/user_model.rb'
load './app/controller/MainController.rb'
class UserController < MainController
	def index
		@users=User.all
		#@user=['hello','hi']
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
		render "login"
		
	end
	def login_post
		@user = User.find_by_username(@params['username'])
  		if @user && @user.password == @params['password']
  			render "success"
  			#puts "success"
  		else
  			render "fail"
  			#puts "Login Error"
  		end
  	#render "success"
	end
	def show
		render "show"
	end
	def edit
	end
	def update
	end
	def destroy
		User.destroy(@id)
	end
end
