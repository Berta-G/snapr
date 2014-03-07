require 'will_paginate'

class SnapsController < ApplicationController
	before_filter :authenticate_user!, :only => [:new, :create]

	def index
		@snaps = Snap.paginate(:page => params[:page], :per_page => 5).order(created_at: :desc, id: :asc)
	end

	def new
		@snap = Snap.new
		@tag = Tag.new
	end

	def create
		
		@snap = Snap.new(snap_params)
		@snap.user_id = current_user.id

		if @snap.save
			flash[:notice] = "Snap! Snap! Yum!"
			make_tags
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

	def json_for(snaps)
		snaps.map do |snap|
			{id: snap.id, src: snap.image.url(:medium),
			 description: snap.description, tags: snap.tags}
		end.to_json
	end

	def tag_params
		params.require(:snap).permit(tag: [:name])
	end

	def push(snap)
		Pusher.trigger('snaps', 'uploaded', 
			{snap: snap, tags: snap.tags, src: snap.image.url(:medium), username: current_user.username}
		)
	end

	def make_tags
		@tags = tag_params["tag"]["name"].downcase.split(" ").map{|tag| Tag.find_or_create_by(name: tag)} 
		@tags.each{|tag| SnapsTag.where(snap_id: @snap.id, tag_id: tag.id).first_or_create}
  end

end