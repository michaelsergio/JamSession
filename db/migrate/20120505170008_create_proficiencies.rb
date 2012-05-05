class CreateProficiencies < ActiveRecord::Migration
  def change
    create_table :proficiencies do |t|
      t.string :skill
      t.string :expertise_level
      t.integer :years_of_experience

      t.timestamps
    end
  end
end
