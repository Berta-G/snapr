require 'will_paginate'

class SnapsController < ApplicationController
	before_filter :authenticate_user!, :only => [:new, :create]

	def index
		@snaps = Snap.paginate(:page => params[:page], :per_page => 5).order(created_at: :desc, id: :asc)

	end

	def new
		@snap = Snap.new
	end

	def create
		@snap = Snap.new(snap_params)
		@snap.user_id = current_user.id
		if @snap.save
			flash[:notice] = "Snap! Snap! Yum!"
			push(@snap)
			redirect_to root_path
		else
			flash[:errors] = format_errors(@snap.errors.messages)
			redirect_to new_snap_path
		end
	end
	
private
	def snap_params
		params.require(:snap).permit(:image, :description)
	end

	def push(snap)
		Pusher.trigger('snaps', 'uploaded', 
			{src: snap.image.url(:medium), description: snap.description }
		)
  end

end