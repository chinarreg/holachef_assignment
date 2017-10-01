class DeliveryBoy < ApplicationRecord
  belongs_to :locality
  has_many :time_slots
end
