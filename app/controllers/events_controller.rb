class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    current_user
    @events = Event.all
    @user_events_participations = Participation.find_by(participant_id: current_user.id)

    if @events.count and @user_events_participations 
      @user_event_attendee = @user_events_participations.event
    end 

  end

  # GET /events/1
  # GET /events/1.json
  def show

    @event = Event.find_by(id: params[:id])
    if @event.participants.count > 1  
      @event.create_pairs
      #binding.pry
      @gift_exchanges = GiftExchange.where(event_id: @event.id)
      #if @gift_exchanges
      #  @recipient = @gift_exchanges.recipient
      #  @recipient_wishlist = Wishlist.find_by(user_id: @recipient.id)
      #end 
    end 

    # @event.create_pairs
#     pre-merge master
#     @gift_exchange = GiftExchange.find_by(event_id: params[:event_id])
    # binding.pry
    # @wishlist = Wishlist.find_by(user_id: @gift_exchange.recipient_id)
    # render "participations/_secret_santa"

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



  private
    # Use callbacks to share common setup or constraints between actions.

    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :description, :start_date, :end_date, :suggested_budget, :creator_id)
    end
end
