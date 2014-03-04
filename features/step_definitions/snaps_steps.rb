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
  expect(page).to have_content("Image can't be blank.")
end

Given(/^I upload a snap without description$/) do
  click_link('Snap!')
  attach_file('snap_image', 'test/img/test.png')
  click_button('Snap!')
end

Then(/^I should see the no description error$/) do
  expect(page).to have_content("Description can't be blank.")
end


Given(/^a user exists$/) do
  @user = User.create(email: "test@test.com", password: "12345678", password_confirmation: "12345678", username: "test", location: "London")
  expect(User.find_by(email: @user.email)).not_to be_nil
end

Given(/^a user logs in$/) do
  click_link('Sign in')
  fill_in('user_email', with: @user.email)
  fill_in('user_password', with: "12345678")
	click_button('Sign in')
end

When(/^I log out$/) do
  click_link('Sign out')
end

Then(/^I am not able to snap$/) do
	visit "/snaps/new"
	expect(page).to have_content("You need to sign in or sign up before continuing.")
	expect(page).not_to have_button("Snap!")
end


