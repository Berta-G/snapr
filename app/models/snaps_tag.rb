class SnapsTag < ActiveRecord::Base

	belongs_to :snap
	belongs_to :tag

end
