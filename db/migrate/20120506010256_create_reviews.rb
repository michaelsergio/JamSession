class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :detail
      t.integer :rating
      t.integer :posted_by
      t.integer :space_id

      t.timestamps
    end
  end
end
