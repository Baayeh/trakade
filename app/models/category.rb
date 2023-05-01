class Category < ApplicationRecord
  has_many :items
  has_many :order_items, through: :items
end
