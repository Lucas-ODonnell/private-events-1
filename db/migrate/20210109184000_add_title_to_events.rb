# frozen_string_literal: true

class AddTitleToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :title, :string
  end
end
