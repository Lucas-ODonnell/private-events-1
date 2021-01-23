# frozen_string_literal: true

class RemoveTimesFromEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :start_time, :datetime
    remove_column :events, :end_time, :datetime
  end
end
