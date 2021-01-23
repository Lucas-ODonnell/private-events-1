class InvitationsController < ApplicationController
  # before_action :authenticate_user!, only: [:index]
  # before_action :correct_creator, only: [:edit, :update]

  def edit_multiple
    @invitations = possible_invitations
    @status_options = possible_statuses
  end

  def update_multiple
    @invitations = Invitation.update(params[:invitations].keys, params[:invitations].values)
    @invitations.reject! { |invite| invite.errors.empty? }
    if @invitations.empty?
      flash[:notice] = "Your RSVP status was updated!"
      redirect_to edit_multiple_invitations_path
    else
      render "edit_multiple"
    end
  end

  private

    def possible_statuses
      Invitation.statuses.map{ |k, v| [k.humanize.capitalize, k] }
    end

    def invitation_params
      params.require(:invitation).permit(:status)
    end

    def possible_invitations
      Invitation.all.select do |invite|
        invite.attendee_id == current_user.id && invite.event.start_date >= Time.zone.today
      end
    end

    # def correct_creator
    #   @event = Event.find(params[:id])
    #   redirect_to(root_url) unless current_user == @event.creator
    # end

end
