class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :u_id
      t.integer :amount
      t.timestamps null: false
    end
  end
end