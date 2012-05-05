class ReplaceImagesUrlsWithImages < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.has_attached_file :profile_picture
    end
    change_table :spaces do |t|
      t.has_attached_file :profile_picture
    end

    remove_column :users, :profile_url
    remove_column :spaces, :profile_url
  end

  def self.down
    drop_attached_file :users, :profile_picture
    drop_attached_file :spaces, :profile_picture
    add_column :users, :profile_url
    add_column :spaces, :profile_url
  end
end
