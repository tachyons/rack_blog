require './app/model/user_model.rb'
load './app/controller/MainController.rb'
class UserController < MainController
	def index
		render "index"
	end
	def new
		render "new"
	end
	def create
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
