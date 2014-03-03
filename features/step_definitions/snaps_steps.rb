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

Given(/^I upload a snap$/) do
  click_link('Snap!')
  fill_in('snap_description', :with => 'Test Description')
  attach_file('snap_image', 'test/img/test.png')
  click_button('Snap!')
end

Then(/^my snap should exist$/) do
	@snap = Snap.find_by(description: 'Test Description')
  expect(@snap).not_to be_nil
end

Then(/^I should see my snap$/) do
  expect(page).to have_content("Snap! Snap! Yum!")
  expect(page).to have_xpath("//img[@src=\"#{@snap.image.url(:medium)}\"]")
end

Given(/^I upload a snap without image$/) do
  click_link('Snap!')
  fill_in('snap_description', :with => 'Test Description')
  click_button('Snap!')
end

Then(/^my snap should not exist$/) do
  @snap = Snap.find_by(description: 'Test Description')
  expect(@snap).to be_nil
end

Then(/^I should see the no image error$/) do
  expect(page).to have_content("Snap! Image can't be blank.")
end

Given(/^I upload a snap without description$/) do
  click_link('Snap!')
  attach_file('snap_image', 'test/img/test.png')
  click_button('Snap!')
end

Then(/^I should see the no description error$/) do
  expect(page).to have_content("Snap! Description can't be blank.")
end