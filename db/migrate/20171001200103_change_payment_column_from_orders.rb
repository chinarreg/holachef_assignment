class ChangePaymentColumnFromOrders < ActiveRecord::Migration[5.1]
  def change
    rename_column :orders, :payment_method_id, :pay_type
  end
end
