class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references:author, null: false,foreign_key:{to_table: :users}, index: true
      t.string :title
      t.integer :comments_counter
      t.integer :likes_counter
      t.text :text
      t.timestamps
      
    end
  end
end
