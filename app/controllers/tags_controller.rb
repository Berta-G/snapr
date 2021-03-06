class TagsController < ApplicationController
before_filter :authenticate_user!
  
  def show
  	@tag = Tag.find_by(id: params[:id])
  	@snaps = @tag.snaps.paginate(:page => params[:page], :per_page => 5).order(created_at: :desc, id: :asc)
  end
end
