class Locality < ApplicationRecord
  has_many :addresses
  has_and_belongs_to_many :food_items
  has_many :delivery_boys
  
  def available_delivery_boys(time)
    self.delivery_boys.includes(:time_slots).where('time_slots.id IS NULL').references(:time_slots)
  end
end
