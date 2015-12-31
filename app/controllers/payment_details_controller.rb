class PaymentDetailsController < ApplicationController
	before_filter :authenticate_user!
  def express
  	response = EXPRESS_GATEWAY.setup_purchase(500,
	    ip: request.remote_ip,
	    return_url: payment_details_create_url,
	    cancel_return_url: root_url,
	    currency: "USD",
	    allow_guest_checkout: true,
	    items: [{name: "Order", description: "Order description", quantity: "1", amount: 500}]
	  )
	  redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
	end

	def create
		# details = EXPRESS_GATEWAY.details_for(params[:token])
		# @payment = PaypalDetail.new(express_token: params[:token], express_payer_id: details.payer_id,
		#                   name: details.params["first_name"], address: details.params["street1"], 
		#                   city: details.params["city_name"], country: details.params["country_name"], zip: details.params["postal_code"])
		# @payment.save
		# redirect_to root_url

		gateway = ActiveMerchant::Billing::PaypalGateway.new(
		  :login => "hemantyuvasoft114-facilitator_api1.gmail.com",
		  :password => "1397208938",
		  :signature => "AFcWxV21C7fd0v3bYYYRCpSSRl31AB0qzpZLCmhl5CbLfNehD8IycL.y"
		)

		credit_card = ActiveMerchant::Billing::CreditCard.new(
		  :type               => "visa",
		  :number             => params[:card_no],
		  :verification_value => params[:csv],
		  :month              => params[:month],
		  :year               => params[:year],
		  :first_name         => params[:first_name],
		  :last_name          => params[:last_name]
		)
		if credit_card.valid?
		  # or gateway.purchase to do both authorize and capture
		  response = gateway.authorize(2, credit_card, :ip => "127.0.0.1")
		  if response.success?
		    gateway.capture(2, response.authorization)
		    reveal = RevealIdentity.find(params[:reveal_id])
		    @subscription = Subscription.create(:user_id => params[:user_id], :payer_id => current_user.id, :subscribable => reveal)
		    flash[:success] = "Payment complete!"
		     @success = true
		  else
		    flash[:alert] = "Error: #{response.message}"
		    @success = false
		  end
		else
		   flash[:alert] = "Error: credit card is not valid. #{credit_card.errors.full_messages.join('. ')}"
		   @success = false
		end
	end
end
