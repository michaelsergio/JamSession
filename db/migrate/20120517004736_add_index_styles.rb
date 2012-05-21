class AddIndexStyles < ActiveRecord::Migration
  def change
    add_index :styles, :name
  end
end
