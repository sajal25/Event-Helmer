class OrdersController < ApplicationController

  def create_order
    current_order
    @event =Event.find(params[:order_item][:event_id])
    @order_item = @order.order_items.create(order_item_params)
    @event_ticket = EventTicket.find(params[:order_item][:event_ticket_id])
    current_ticket_quantity = @event_ticket.available_quantity - @order_item.item_quantity 
    @event_ticket.update(available_quantity: current_ticket_quantity)
    respond_to do |format|
      format.js
    end
  end


  def register_for_event
    @event =Event.find(params[:event_id])
    @order =Order.find(params[:order_id])
    if user_signed_in?
      @user = current_user
    else
      @user = User.new
    end
  end

  def create_event_registration
    @event=Event.find(params[:user_data][:event_id])  
    @order=Order.find(params[:user_data][:order_id])
    @stripe = StripeOperation.new
    if user_signed_in?
      @user = current_user
      stripe_customer = @stripe.create_stripe_customer(@user.email, params[:user_data][:card_holdername], params[:user_data][:card_token])
      @stripe.retrive_stripe_customer(stripe_customer.id)
      @order.update(user_id: @user.id, event_id: @event_id)
      @stripe.create_stripe_charge(@order.total, @user.email, stripe_customer.id)
      @user.user_events.create(event_id: @event.id)

      NotificationMailer.welcome_email(@user, @event).deliver_now
      NotificationMailer.booking_alert_to_employeer(@event.event_organizer, @user).deliver_now

      redirect_to orders_message_confirmation_path , flash: {success: 'You are registered successfully.'} 
    else
      @user=User.new(user_params)
      if @user.save
        stripe_customer = @stripe.create_stripe_customer(@user.email, params[:user_data][:card_holdername], params[:user_data][:card_token])
        @stripe.retrive_stripe_customer(stripe_customer.id)
        @order.update(user_id: @user.id, event_id: @event_id)
        @stripe.create_stripe_charge(@order.total, @user.email, stripe_customer.id)
        @user.user_events.create(event_id: @event.id)
        sign_in(@user,scope: :user)

        NotificationMailer.welcome_email(@user, @event).deliver_now
        NotificationMailer.booking_alert_to_employeer(@event.event_organizer, @user).deliver_now
        redirect_to orders_message_confirmation_path , flash: {success: 'You are registered successfully.'}
      end
    end
  end

  def payment_confirmation
    
  end


  def message_confirmation

  end 


  def delete_order_item
    @event =Event.find(params[:event_id])
    @order_item = OrderItem.find(params[:order_item_id])
    @event_ticket = EventTicket.find(params[:ticket_id])
    @event_ticket.update(available_quantity: @event_ticket.available_quantity + @order_item.item_quantity)
    @order_item.destroy
  end

  def update_order_item
    @event =Event.find(params[:order_item][:event_id])
    @event_ticket = @event.event_tickets.find(params[:order_item][:event_ticket_id])
    @order_item =OrderItem.find(params[:order_item][:order_item_id])
    previous_quantity =@order_item.item_quantity
    if @order_item.update(order_item_params)
      current_quantity = @order_item.item_quantity - previous_quantity
      @event_ticket.update(available_quantity: @event_ticket.available_quantity - current_quantity)
      respond_to do |format|
        format.js
      end 
    end  
  end

  def checkout_for_event
    @event = Event.find(params[:event_id])
    @order = Order.find(params[:order_id])
    @user = User.find(params[:user_id])

    @event=Event.find(params[:user_data][:event_id])  
    @order=Order.find(params[:user_data][:order_id])
    @stripe = StripeOperation.new
    if user_signed_in?
      @user = current_user
      stripe_customer = @stripe.create_stripe_customer(@user.email, params[:user_data][:card_holdername], params[:user_data][:card_token])
      @stripe.retrive_stripe_customer(stripe_customer.id)
      @order.update(user_id: @user.id, event_id: @event_id)
      @stripe.create_stripe_charge(@order.total, @user.email, stripe_customer.id)
      @user.user_events.create(event_id: @event.id)

      NotificationMailer.welcome_email(@user, @event).deliver_now
      NotificationMailer.booking_alert_to_employeer(@event.event_organizer, @user).deliver_now

      redirect_to root_path, flash: {success: 'You are registered successfully.'} 
    else
      @user=User.new(user_params)
      if @user.save
        stripe_customer = @stripe.create_stripe_customer(@user.email, params[:user_data][:card_holdername], params[:user_data][:card_token])
        @stripe.retrive_stripe_customer(stripe_customer.id)
        @order.update(user_id: @user.id, event_id: @event_id)
        @stripe.create_stripe_charge(@order.total, @user.email, stripe_customer.id)
        @user.user_events.create(event_id: @event.id)
        sign_in(@user,scope: :user)

        NotificationMailer.welcome_email(@user, @event).deliver_now
        NotificationMailer.booking_alert_to_employeer(@event.event_organizer, @user).deliver_now
        redirect_to root_path, flash: {success: 'You are registered successfully.'}
      end
    end


  end


  private 

  def order_item_params
    params.require(:order_item).permit(:item_name, :item_quantity, :price)
  end

  def user_params
    params.require(:user_data).permit(:first_name, :last_name, :username, :contact, :email, :password)
  end

end
