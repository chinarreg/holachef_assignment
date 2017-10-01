class CreateJoinTableLocalityFoodItem < ActiveRecord::Migration[5.1]
  def change
    create_join_table :localities, :food_items do |t|
      # t.index [:locality_id, :food_item_id]
      # t.index [:food_item_id, :locality_id]
    end
  end
end
