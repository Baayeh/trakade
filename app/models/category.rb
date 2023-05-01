class Category < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :order_items, through: :items, dependent: :destroy
end
