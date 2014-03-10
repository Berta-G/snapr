class CommentsController < ApplicationController
before_filter :authenticate_user!

	def create
		@snap = Snap.find_by_id(params[:comment][:snap_id])
		@comment = @snap.comments.new
		@comment.user_id = current_user.id
		@comment.comment = params[:comment][:comment]
		
		if @comment.save
			flash[:notice] = "Snap! Snap! Commented!"
			redirect_to snap_path(@snap.id)
		else
			flash[:errors] = format_errors(@comment.errors.messages)
			redirect_to snap_path(@snap.id)
		end
	end
end
