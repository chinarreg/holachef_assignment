class CreateLocalities < ActiveRecord::Migration[5.1]
  def change
    create_table :localities do |t|
      t.string :name
      t.string :city
      t.timestamps
    end
  end
end
