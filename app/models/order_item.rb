class OrderItem < ApplicationRecord
  belongs_to :category
  belongs_to :item
  belongs_to :order
end
