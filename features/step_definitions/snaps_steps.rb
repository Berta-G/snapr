Given(/^several snaps exist$/) do
 
	Dir.glob(File.join(Rails.root, '/test/img', '*')).each do |path|
 		s = Snap.new(description: "This is #{path}", image: File.open(path)).save!
 	end

end

Given(/^I am on the homepage$/) do
  visit "/"
end

Then(/^I see several snaps$/) do
	Snap.all.each do |snap|
  expect(page).to have_content(snap.description)
	expect(page).to have_xpath("//img[@src=\"#{snap.image.url(:medium)}\"]")
	end
end
