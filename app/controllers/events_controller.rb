class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show]
  before_action :correct_creator, only: [:edit, :update]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    # This tells the form to display the invitation section
    @event.invitations.build
    # Remove the current user from this list?
    # @users = User.all
    @user_options = User.all.map{ |u| [ u.name, u.id ] }
  end
  
  def create

    @user_options = User.all.map{ |u| [ u.name, u.id ] }
    @event = current_user.created_events.build(event_params)
    # @event.invitations.build(attendee_id: 'id')
    
    if @event.save
      flash[:notice] = "Your event was created!"
      redirect_to @event
    else
      # @users = User.all
      # byebug
      raise 'hell'
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      flash[:notice] = "Your event was updated!"
      redirect_to @event
    else
      render :edit
    end
  end

  private
  
    def event_params
      params.require(:event).permit(:creator_id, 
                                    :title,
                                    :start_time, 
                                    :end_time, 
                                    :location, 
                                    :description,
                                    invitations_attributes: [:attendee_id])
    end

    def correct_creator
      @event = Event.find(params[:id])
      redirect_to(root_url) unless current_user == @event.creator
    end
end
