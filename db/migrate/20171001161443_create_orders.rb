class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.float :time
      t.integer :address_id
      t.integer :food_item_id
      t.integer :payment_method_id
      t.integer :user_id
      t.integer :status
      t.integer :delivery_boy_id
      t.decimal :amount
      t.timestamps
    end
  end
end
