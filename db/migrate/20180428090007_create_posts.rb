class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      
      t.integer :user_id
      t.string :col_title
      t.text :col_content

      t.timestamps null: false
    end
  end
end
