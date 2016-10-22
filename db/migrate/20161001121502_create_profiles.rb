class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :summoner_name
      t.date :birthday
      t.text :content
      t.string :champion1
      t.string :champion2
      t.string :champion3
      t.string :twitter_url
      t.string :facebook_url
      t.integer :user_id

      t.timestamps
    end
  end
end
