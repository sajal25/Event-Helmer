class StripeOperation
	require "stripe"
	Stripe.api_key = Rails.application.secrets.stripe_secret_key

	def initialize()
	end

	def create_stripe_customer(email, card_holder_name, card_token)
		customer = Stripe::Customer.create(
      email: email, 
      source: card_token,
      description: card_holder_name
    )
    customer
	end

	def create_stripe_charge(amount, customer_email, cust_id)
    charge = Stripe::Charge.create(
        amount: amount,
        currency: 'usd',
        customer: cust_id
      )		
	end

	def retrive_stripe_customer(customer_id)
		customer = Stripe::Customer.retrieve(customer_id)
	end

  def create_stripe_product(product_name)
    product = Stripe::Product.create(
        name: product_name,
        type: 'service'
      )
  end

end