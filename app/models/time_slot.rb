class TimeSlot < ApplicationRecord
  belongs_to :delivery_boy
  TIMES = [10, 11, 12, 13, 14, 18, 19, 20, 21]
end
