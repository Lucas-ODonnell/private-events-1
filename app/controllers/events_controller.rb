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
    @attendee_options = possible_attendees
  end
  
  def create
    @event = current_user.created_events.build(event_params)
    
    if @event.save
      # Service Object for invitations "Through" Table
      InvitationManager.new(@event, invitation_params).create_invitations

      flash[:notice] = "Your event and invitations were created!"
      redirect_to @event
    else
      @attendee_options = possible_attendees
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
    @attendee_options = possible_attendees
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      # Service Object for invitations "Through" Table
      InvitationManager.new(@event, invitation_params).update_invitations
      
      flash[:notice] = "Your event and invitations were updated!"
      redirect_to @event
    else
      render :edit
      @attendee_options = possible_attendees
    end
  end

  private
  
    def event_params
      params.require(:event).permit(:creator_id,
                                    :title,
                                    :start_date,
                                    :start_time,
                                    :end_date,
                                    :end_time,
                                    :location,
                                    :description)
    end

    def invitation_params
      params.require(:event).permit(invitations: [:attendee_id => []])
    end

    def correct_creator
      @event = Event.find(params[:id])
      redirect_to(root_url) unless current_user == @event.creator
    end

    def possible_attendees
      User.all.reject { |user| user == current_user  }
    end
end
