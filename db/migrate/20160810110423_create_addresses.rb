class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :address
      t.decimal :lat 
      t.decimal :lng 
      t.timestamps null: false
    end
  end
end
