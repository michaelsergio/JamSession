class RemoveOwnerIdFromSpace < ActiveRecord::Migration
  def change
    remove_column :spaces, :owner_id, :integer
  end
end
