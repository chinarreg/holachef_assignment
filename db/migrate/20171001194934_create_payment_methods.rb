class CreatePaymentMethods < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_methods do |t|
      t.integer :pay_type
      t.integer :status
      t.integer :order_id

      t.timestamps
    end
  end
end
