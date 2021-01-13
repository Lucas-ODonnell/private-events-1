class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      flash[:notice] = "Your event was created!"
      redirect_to @event
    else
      render :new
    end
  end

  private
  
    def event_params
      params.require(:event).permit(:creator_id, 
                                    :title,
                                    :start_time, 
                                    :end_time, 
                                    :location, 
                                    :description)
    end 
end
