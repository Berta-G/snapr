Given(/^I buy the snap$/) do
  click_button("Buy")
  within_frame('stripe_checkout_app') do
		  fill_in("card_number", :with => "4242424242424242")
		  fill_in("cc-exp", :with => "12/15")
		  fill_in("cc-csc", :with => "123")
	  	click_button("Place order £5.00")
	  	sleep(2)
  end
end

Then(/^I see a confirmation$/) do
  expect(page).to have_content("Thank you for your purchase")
end

