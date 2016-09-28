class CreateItemsets < ActiveRecord::Migration[5.0]
  def change
    create_table :itemsets do |t|
      t.string :title, null: false
      t.text :content
      t.string :champion
      t.string :item0_id
      t.string :item1_id
      t.string :item2_id
      t.string :item3_id
      t.string :item4_id
      t.string :item5_id
      t.boolean :private, default: false
      t.integer :user_id

      t.timestamps
    end
  end
end
