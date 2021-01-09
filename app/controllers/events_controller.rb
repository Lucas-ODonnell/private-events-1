class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show]

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    @event.creator = current_user

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
