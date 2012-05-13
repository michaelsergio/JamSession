class RemoveProficienciesFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :proficiencies
  end
end
