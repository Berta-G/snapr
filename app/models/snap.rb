class Snap < ActiveRecord::Base

	has_attached_file :image, :styles => { :large => "600x600", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_presence_of :image, :description
  
  belongs_to :user  
  has_many :snaps_tags
  has_many :tags, through: :snaps_tags
  accepts_nested_attributes_for :tags
  acts_as_commentable

  def is_mappable
  	self.tiff_jpeg? && self.has_gps?
  end

  def tiff_jpeg?
  	["image/jpeg", "image/tiff"].include?(self.image_content_type)
  end

  def has_gps?
		!EXIFR::JPEG.new(self.image.path).gps.nil?
  end
  
end
