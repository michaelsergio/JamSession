class AddOwnerToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :owner_id, :integer
  end
end
