class UsersController < ApplicationController
	before_filter :authenticate_user!
	
	def show
		@snaps = current_user.snaps.paginate(:page => params[:page], :per_page => 5).order(created_at: :desc, id: :asc)
	end
end
