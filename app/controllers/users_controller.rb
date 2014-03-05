class UsersController < ApplicationController
	before_filter :authenticate_user!
	
	def show
		@snaps = current_user.snaps
	end
end
