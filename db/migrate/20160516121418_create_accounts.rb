class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :user_id
      t.string :ac_name
      t.float :ac_no
      t.timestamps null: false
    end
  end
end
