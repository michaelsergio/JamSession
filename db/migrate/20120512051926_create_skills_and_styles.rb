class CreateSkillsAndStyles < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name

      t.timestamps
    end

    create_table :personal_skills do |t|
      t.references :skill
      t.references :user
      t.integer :expertise_level
      t.integer :years_of_experience
      t.timestamps
      
    end

    create_table :styles do |t|
      t.string :name
      t.timestamps
    end

    create_table :personal_styles do |t|
      t.references :style
      t.references :user
      t.timestamps

    end
  end
end
