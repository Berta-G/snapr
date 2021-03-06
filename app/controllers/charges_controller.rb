class ChargesController < ApplicationController
	before_filter :authenticate_user!
	
	def new
	end

	def create
		begin
		  # Amount in cents
		  @amount = 500

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
			UserMailer.purchase(current_user, session[:snap_id]).deliver
			redirect_to root_path

		rescue Exception => e
		  flash[:error] = e.message
		  redirect_to root_path
		end
	end
end
