class RsvpsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @rsvp = Rsvp.new(attendee_id: current_user.id, attended_event_id: params[:event_id])
    # @rsvp = Rsvp.new(rsvp_params)
    if !@rsvp.save
      flash[:notice] = @rsvp.errors.full_messages.to_sentence
    else
      flash[:success] = "You're registered to attend!"
    end
    # redirect_to event_url
    redirect_back(fallback_location: events_url)
  end

  def destroy
    @rsvp = Rsvp.find_by(attendee_id: current_user.id, attended_event_id: params[:event_id])
    # @rsvp = current_user.rsvps.find(params[:event_id])
    # rsvp = @rsvp.attended_event
    
    @rsvp.destroy
    redirect_to event_url
    # redirect_back(fallback_location: events_url)
  end

  private


  def rsvp_params
    params.require(:rsvp).permit(:attendee_id, :attended_event_id, :id)
  end
end
