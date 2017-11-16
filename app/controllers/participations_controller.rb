class ParticipationsController < ApplicationController

  def index
  end

  def new
    @event = Event.find_by(id: params[:event_id])
    # debugger
  end

  def create
    @event = Event.find_by(id: params[:event_id])

    if !Participation.find_by(participant_id: @event.creator.id, event_id: @event.id)
      Participation.create(participant_id: @event.creator.id, event_id: @event.id)
    end  

    @user = User.find_by(email: params[:user][:email])
    if @user
      Participation.create(participant_id: @user.id, event_id: @event.id)
    end
    if request.xhr?
      render json: @user
    else 
      redirect_to "/events/#{@event.id}/participations/new"
    end
  end

  def controller_params
    params.require(:participation).permit(:event_id, :participant_id)
  end
end