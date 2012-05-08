class AddLatitudeAndLongitudeToSpace < ActiveRecord::Migration
  def change
    add_column :spaces, :latitude, :float
    add_column :spaces, :longitude, :float
  end
end
