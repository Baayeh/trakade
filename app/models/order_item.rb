class OrderItem < ApplicationRecord
  belongs_to :category
  belongs_to :item, optional: true
  belongs_to :order
end
