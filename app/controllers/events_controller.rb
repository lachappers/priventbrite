class EventsController < ApplicationController
  before_action :set_event, :get_usernames, only: %i[ edit update show destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
 

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.new(event_params)
    if @event.save
      flash[:success] = "Great! Your event has been created!"
      redirect_to @event
    else
      flash.now[:error] = @event.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @events = Event.all.order(date: :asc)
    # scope to see own events only
    # @events = current_user.events
    @attended_events = current_user.attended_events.order(date: :asc)
    
  end

  def show
    @event = Event.find(params[:id])
    get_usernames
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:success] = "event was successfully destroyed."
    redirect_to root_path, status: :see_other
  end

  def edit
    # @event = Event.find(params[:id])
  end

  def update
      if @event.update(event_params)
        flash[:success] = "event was successfully updated."
        redirect_to event_url(@event)
      else
        flash.now[:error] = @event.errors.full_messages.to_sentence
        render :edit, status: :unprocessable_entity
      end
  end

  private
  def event_params
    params.require(:event).permit(:date, :location, :start_time, :title, :description, :creator_id, :id)
  end
  def set_event
    # users can see all events
    @event = Event.find(params[:id])
    # users can only see their own events
    # @event = current_user.events.find(params[:id])
  end
  def get_usernames
    people = User.find(@event.attendee_ids)
    @usernames = people.pluck(:username)
  end

end
