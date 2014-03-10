Given(/^I comment on the snap$/) do
  fill_in('comment_comment', :with => 'Test Comment')
  click_button('Comment')
end

Then(/^my comment should exist$/) do
  @comment = Comment.find_by_comment('Test Comment')
  expect(@comment).not_to be_nil
  expect(Comment.all.count).to eq(1)
end

Then(/^I should see the comment$/) do
  expect(page).to have_content(@comment.comment)
end