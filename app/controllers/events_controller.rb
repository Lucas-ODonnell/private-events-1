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
    @users = User.all
  end
  
  def create
    @event = current_user.created_events.build(event_params)
    
    if @event.save
      invitation_params[:invitations][:attendee_id].each do |attendee_id|
        @event.invitations.create(attendee_id: attendee_id)
      end

      flash[:notice] = "Your event and invitations were created!"
      redirect_to @event
    else
      @users = User.all
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
    # Remove the current user from this list?
    @users = User.all
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      # Need to remove/destroy invitations if un-checked
      invitation_params[:invitations][:attendee_id].each do |attendee_id|
        next if @event.attendees.ids.include?(attendee_id.to_i)

        @event.invitations.create(attendee_id: attendee_id)
      end
      flash[:notice] = "Your event and invitations were updated!"
      redirect_to @event
    else
      render :edit
      @users = User.all
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

    def invitation_params
      params.require(:event).permit(invitations: [:attendee_id => []])
    end

    def correct_creator
      @event = Event.find(params[:id])
      redirect_to(root_url) unless current_user == @event.creator
    end
end
