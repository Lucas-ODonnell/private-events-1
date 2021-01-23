# frozen_string_literal: true

class InvitationManager
  def initialize(event, params)
    @event = event
    @attendee_ids = params[:invitations][:attendee_id]
  end

  def create_invitations
    @attendee_ids.each do |id|
      next if @event.attendees.ids.include?(id.to_i)

      @event.invitations.create(attendee_id: id)
    end
  end

  def destroy_invitations
    @event.attendees.ids.each do |id|
      next if @attendee_ids.include?(id.to_s)

      invitation = @event.invitations.where(attendee_id: id)
      @event.invitations.destroy(invitation)
    end
  end

  def update_invitations
    create_invitations
    destroy_invitations
  end
end
