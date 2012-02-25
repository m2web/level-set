class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.integer :user_id
      t.text :about_me
      t.string :want_to

      t.timestamps
    end
  end
end
