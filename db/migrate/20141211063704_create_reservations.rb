class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :member_id, null: false
      t.integer :detail_id, null: false
      t.integer :people
      t.string :food
      t.boolean :canceld
      t.timestamps
    end
  add_index :reservations, :member_id
  add_index :reservations, :detail_id
  end
end
