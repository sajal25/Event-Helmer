class Organizer::EventsController < ApplicationController
  before_action :authenticate_event_organizer!
  layout 'event'
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  # GET /events
  # GET /events.json
  def index
    @q = current_event_organizer.events.ransack(params[:q])
    @events = @q.result(distinct: true).order(:name).page params[:page]
    #  if params[:search].present?
    #   @events  = Event.near(params[:search], 50, :order => :distance)
    # else
    #   @events = Event.all
    # end
    # @events = @event_type.events

  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search_event_by_location
    lat = params[:search_location][:latitude]
    long = params[:search_location][:longitude]

    @events = Event.near([lat, long], 50, units: :km)

  end

  def search_event_by_type
    @events = Event.all
    @q = Event.ransack(params[:q])
    @events = @q.result(distinct: true).order(:name).page params[:page]
  end

  def get_event_tickets
    @event = Event.friendly.find(params[:id])
    @event_tickets = @event.event_tickets   
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :description, :start_datetime, :end_datetime, :venue, :city, :country, :zipcode, :latitude, :longitude, :cover_image, :is_free, :is_paid, :event_organizer_id, event_tickets_attributes: [:id, :name, :available_quantity, :ticket_sales_start_datetime, :ticket_sales_end_datetime, :price, :ticket_description, :is_free, :is_paid, :_destroy])
    end
end
