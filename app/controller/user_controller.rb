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
		@user = User.new(@params)
		#@user.password=@params.inspect
		@user.save
	end
	def show
	end
	def edit
	end
	def update
	end
	def destroy
	end
end
