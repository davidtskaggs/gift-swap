class ParticipationsController < ApplicationController

  def index
    @participations = Participation.all

  end

  def new
    @event = Event.find_by(id: params[:event_id])
  end

  def create
      @event = Event.find_by(id: params[:event_id])
      @user = User.find_by(email: params[:user][:email])
    if @user
      @participation = @event.participations.create(participant_id: @user.id)
    end
    if request.xhr?
      render json: @user
    end
  end

  def

  def controller_params
    params.require(:participation).permit(:event_id, :participant_id)
  end
end