class HomeController < ApplicationController
	before_action :authenticate_event_organizer!, only: [:payment_process]
	layout 'event'
	
	def index
		@event_types = EventType.all
	end

	def contact_us
	end

	def how_it_works
	end

	def pricing_table
		@plans = MembershipPlan.all
	end

	def payment_process
		@plan = MembershipPlan.find(params[:plan_id])
	end
  
  def terms_of_services
  end

	def area_events
		@events = Event.where(city: params[:city])
	end

	def search_near_by_events
		if params[:event_search][:lat].present? && params[:event_search][:lng].present? && params[:event_search][:find].present?
			@event_type = EventType.find(params[:event_search][:find])
			@events = @event_type.events.near([lat, lng], 50, units: :km)

		elsif params[:event_search][:lat].present? && params[:event_search][:lng].present?
			lat = params[:event_search][:lat]
		    lng = params[:event_search][:lng]
		    @events = Event.near([lat, lng], 50, units: :km)
		    
		elsif params[:event_search][:find].present?
			@event_type = EventType.find(params[:event_search][:find])
			@events = @event_type.events
		end
	end

	def create_contact
		@contact = Contact.new(contact_params)
		if @contact.save
			NotificationMailer.contact_notification_mailer(@contact).deliver_now
			respond_to do |format|
				format.html {redirect_to contact_us_path, notice: "Thank you for contacting us." }
			end
		end
	end

	private 

		def contact_params
			params.require(:contact).permit(:name, :email, :message)
		end

end
