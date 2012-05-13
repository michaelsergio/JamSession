class DropProficiencies < ActiveRecord::Migration
  def change
    drop_table :proficiencies
  end
end
