Given(/^I visit my profile page$/) do
	click_on "My Profile"
end

Then(/^I should see my profile$/) do
  expect(page).to have_content(@user.username)
  expect(page).to have_content(@user.location)
  expect(page).to have_content(@user.email)
  expect(page).to have_content(@user.location)
end

Then(/^I should see snaps I uploaded$/) do
 	@user.snaps.each do |snap|
  	expect(page).to have_content(snap.description)
		expect(page).to have_xpath("//img[@src=\"#{snap.image.url(:medium)}\"]")
	end
end

