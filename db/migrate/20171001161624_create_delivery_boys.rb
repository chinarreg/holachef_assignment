class CreateDeliveryBoys < ActiveRecord::Migration[5.1]
  def change
    create_table :delivery_boys do |t|
      t.string :name
      t.string :mobile
      t.integer :locality_id
      t.timestamps
    end
  end
end
