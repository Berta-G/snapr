Given(/^I buy the snap$/) do
  click_button("Pay with Card")
  within_frame('stripe_checkout_app') do
		  fill_in("Email", :with => @user.email)
		  fill_in("card_number", :with => "4242424242424242")
		  fill_in("cc-exp", :with => "12/15")
		  fill_in("cc-csc", :with => "123")
	  	click_button("Pay $5.00")
	  	sleep(2)
  end
end

Then(/^I see a confirmation$/) do
  
end

Then(/^I own the snap$/) do
  pending # express the regexp above with the code you wish you had
end
