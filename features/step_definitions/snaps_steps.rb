Given(/^several snaps exist$/) do
 
	Dir.glob(File.join(Rails.root, '/test/img', '*')).each do |path|
 		s = Snap.new(description: "This is #{path}", image: File.open(path)).save!
 	end

end

Given(/^I am on the homepage$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I see several snaps$/) do
  pending # express the regexp above with the code you wish you had
end
