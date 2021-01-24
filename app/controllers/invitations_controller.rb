# frozen_string_literal: true

class InvitationsController < ApplicationController
  before_action :authenticate_user!, only: %i[edit_multiple update_multiple]

  # Instead of custom methods, look into name-spaced controllers (example: /user/#/invitations)
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
      Invitation.statuses.map { |k, _v| [k.humanize.capitalize, k] }
    end

    def invitation_params
      params.require(:invitation).permit(:status)
    end

    def possible_invitations
      Invitation.all.includes([event: [:creator]]).select do |invite|
        invite.attendee_id == current_user.id && invite.event.start_date >= Time.zone.today
      end
    end
end
