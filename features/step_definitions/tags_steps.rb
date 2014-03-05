Given(/^I upload a snap with one tag$/) do
  click_link('Snap!')
  fill_in('snap_description', :with => 'Test Description')
  attach_file('snap_image', 'test/img/test.png')
  fill_in('snap_tag_name', :with => 'Tag1')
  click_button('Snap!')
end

Then(/^my tag should exist$/) do
	@snap = Snap.find_by(description: 'Test Description')
  @tags = @snap.tags
 	expect(@tags.count).to eq(1)
	expect(@tags.first.name).to eq('Tag1')
end

Then(/^I should see my snap with tag$/) do
  pending # express the regexp above with the code you wish you had
end

