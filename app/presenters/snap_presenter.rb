class SnapPresenter
	DEFAULT_SIZE = :medium

	def initialize(snap = nil, size = DEFAULT_SIZE)
		@snap = snap
		@size = size || DEFAULT_SIZE
	end

  def is_mappable?
  	self.tiff_jpeg? && self.has_gps?
  end

  def tiff_jpeg?
  	["image/jpeg", "image/tiff"].include?(@snap.image_content_type)
  end

  def has_gps?
    logger.info "EXIFR Begin"
		!EXIFR::JPEG.new(image_path).gps.nil?
  end

  def image_path
		Rails.env.production? ? @snap.image.url(@size).split("?").first : @snap.image.path
  end

  def longitude
  	EXIFR::JPEG.new(open(self.image_path)).gps.to_h[:longitude] 
  end

  def latitude
  	EXIFR::JPEG.new(open(self.image_path)).gps.to_h[:latitude]
  end

  def method_missing(method)
    @snap.send(method) rescue nil
  end

end