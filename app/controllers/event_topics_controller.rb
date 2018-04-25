class EventTopicsController < ApplicationController
  before_action :set_event_topic, only: [:show, :edit, :update, :destroy]

  # GET /event_topics
  # GET /event_topics.json
  def index
    @event_topics = EventTopic.all
  end

  # GET /event_topics/1
  # GET /event_topics/1.json
  def show
  end

  # GET /event_topics/new
  def new
    @event_topic = EventTopic.new
  end

  # GET /event_topics/1/edit
  def edit
  end

  # POST /event_topics
  # POST /event_topics.json
  def create
    @event_topic = EventTopic.new(event_topic_params)

    respond_to do |format|
      if @event_topic.save
        format.html { redirect_to @event_topic, notice: 'Event topic was successfully created.' }
        format.json { render :show, status: :created, location: @event_topic }
      else
        format.html { render :new }
        format.json { render json: @event_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_topics/1
  # PATCH/PUT /event_topics/1.json
  def update
    respond_to do |format|
      if @event_topic.update(event_topic_params)
        format.html { redirect_to @event_topic, notice: 'Event topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_topic }
      else
        format.html { render :edit }
        format.json { render json: @event_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_topics/1
  # DELETE /event_topics/1.json
  def destroy
    @event_topic.destroy
    respond_to do |format|
      format.html { redirect_to event_topics_url, notice: 'Event topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_topic
      @event_topic = EventTopic.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_topic_params
      params.require(:event_topic).permit(:name, :description)
    end
end
