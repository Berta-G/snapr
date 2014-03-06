class Tag < ActiveRecord::Base
	has_many :snaps_tags
	has_many :snaps, through: :snaps_tags
end
