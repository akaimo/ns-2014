class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.references :tour_infomation, null: false
      t.date :start, null: false
      t.date :finish, null: false
      t.integer :price, null: false
      t.integer :limit, null: false
      t.integer :lowst, null: false
      t.timestamps
    end
    add_index :details, :tour_infomation_id
  end
end
