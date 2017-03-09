class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.integer :mob_no
      t.timestamps null: false
    end
  end
end
