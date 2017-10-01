class PaymentMethod < ApplicationRecord
  belongs_to :order
  enum pay_type: [:online, :wallet, :cod]
  enum status: [:success, :failure]
end
