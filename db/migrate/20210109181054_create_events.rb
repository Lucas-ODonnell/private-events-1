class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.integer :creator_id
      t.datetime :start_time
      t.datetime :end_time
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end
