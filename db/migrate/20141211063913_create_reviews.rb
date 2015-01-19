class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :member_id, null: false
      t.integer :tour_infomation_id, null: false
      t.string :title, null: false
      t.string :content, null: false
      t.timestamps
    end
   add_index :reviews, :member_id
   add_index :reviews, :tour_infomation_id
  end
end
