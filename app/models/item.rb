class Item < ApplicationRecord
  belongs_to :category
  has_many :order_items
end
