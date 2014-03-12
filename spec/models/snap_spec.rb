require 'spec_helper'

describe Snap do
	let(:png_snap) {Snap.new(description: "test", image: File.open(File.join(Rails.root, '/test/img/first.png')))}
	let(:jpg_snap) {Snap.new(description: "test", image: File.open(File.join(Rails.root, '/test/img/first.jpg')))}
	let(:exif_snap){Snap.new(description: "test", image: File.open(File.join(Rails.root, '/test/img/exif.jpg')))}

	it "should know if snap is a jpeg" do 
		expect(png_snap.tiff_jpeg?).to be_false
		expect(jpg_snap.tiff_jpeg?).to be_true
	end

	it "should know if snap has gps data" do 
		exif_snap.save
		jpg_snap.save
		expect(exif_snap.has_gps?).to be_true
		expect(jpg_snap.has_gps?).to be_false
	end
end
