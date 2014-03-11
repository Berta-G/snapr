class ChargesController < ApplicationController
	before_filter :authenticate_user!
	
	def new
	end

	def create
	  # Amount in cents
	  @amount = 600

	  customer = Stripe::Customer.create(
	    :email => current_user.email,
	    :card  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => current_user.username+' Rails Stripe customer',
	    :currency    => 'gbp'
	  )

	flash[:notice] = "Thank you for your purchase"
	redirect_to root_path

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end
end
