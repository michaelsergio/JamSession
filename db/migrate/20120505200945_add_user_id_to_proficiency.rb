class AddUserIdToProficiency < ActiveRecord::Migration
  def change
    add_column :proficiencies, :user_id, :integer
  end
end
