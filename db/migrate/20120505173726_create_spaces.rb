class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.string :name
      t.string :location
      t.decimal :hourly_pricing
      t.text :description
      t.string :availability
      t.string :equipment
      t.string :capacity
      t.string :size
      t.string :rooms
      t.text :about

      t.timestamps
    end
  end
end
