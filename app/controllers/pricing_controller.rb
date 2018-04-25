class PricingController < ApplicationController

  def create_member_ship
    @membership_plan = MembershipPlan.find(params[:payment_info][:plan_id])
    @event_organizer = EventOrganizer.find(params[:payment_info][:organizer_id])
    @stripe = StripeOperation.new
    @stripe.create_stripe_product(@membership_plan.name)
    stripe_customer = @stripe.create_stripe_customer(@event_organizer.email, params[:payment_info][:card_holdername], params[:payment_info][:card_token])
    @stripe.create_stripe_charge(@membership_plan.price_per_six_month, @event_organizer.email, stripe_customer.id)
    @organizer_membership = OrganizerMembership.create(event_organizer_id: @event_organizer.id, membership_plan_id: @membership_plan.id, plan_registered: true, status: "Paid")
  end

end