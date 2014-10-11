load './app/controller/MainController.rb'
class User < MainController
	def index
		render "index"
	end
end
