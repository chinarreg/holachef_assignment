class FoodItem < ApplicationRecord
  has_and_belongs_to_many :localities
  belongs_to :order
end
