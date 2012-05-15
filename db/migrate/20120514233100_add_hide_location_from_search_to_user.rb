class AddHideLocationFromSearchToUser < ActiveRecord::Migration
  def change
    add_column :users, :hide_location_from_search, :boolean
  end
end
