class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :phone, null: false
      t.string :email
      t.string :login_id, null: false
      t.string :hashed_password, null: false
      t.boolean :administrator, null: false, default: false
      t.timestamps
    end
  end
end
