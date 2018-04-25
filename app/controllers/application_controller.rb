class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout 'event'
  helper_method :current_order

  def current_order
  	@order = Order.find_by(id: session[:order_id])
  	if @order.nil?
  		@order = Order.create!
  		session[:order_id] = @order.id
  	end
  	session[:order_id]
  end

end
