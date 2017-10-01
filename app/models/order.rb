class Order < ApplicationRecord
  include AASM

  belongs_to :address
  belongs_to :food_item
  belongs_to :payment_method
  belongs_to :user
  belongs_to :delivery_boy
  
  accepts_nested_attributes_for :address
  
  before_save :calculate_amount

  enum status: [:pending, :received, :completed]
  
  aasm column: 'status', enum:true do
    state :pending, :initial => true
    state :received, :completed

    event :paid do
      before do
        allocate_delivery_boy
      end      
      transitions :from => :pending, :to => :received
    end

    event :delivered do
      # after do
      #   deallocate_delivery_boy
      # end      
      transitions :from => [:pending, :received], :to => :completed
    end

  end
  
  def calculate_amount
    self.amount = self.food_item.price
  end
  
  def allocate_delivery_boy
    d_boy = self.address.locality.available_delivery_boys(self.time).first
    d_boy.time_slot.create(:time => self.time)
    self.update(:delivery_boy_id => d_boy.id)
  end
  
end
