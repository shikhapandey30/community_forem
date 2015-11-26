class PaymentDetailsController < ApplicationController
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
		details = EXPRESS_GATEWAY.details_for(params[:token])
		@payment = PaypalDetail.new(express_token: params[:token], express_payer_id: details.payer_id,
		                  name: details.params["first_name"], address: details.params["street1"], 
		                  city: details.params["city_name"], country: details.params["country_name"], zip: details.params["postal_code"])
		@payment.save
		redirect_to root_url
	end
end
