class AddColumnsToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :order_status, :string
    add_column :orders, :payment_status, :boolean
    add_column :orders, :shipping_address, :text
    add_column :orders, :billing_address, :text
    add_column :orders, :shipping_method, :string
    add_column :orders, :tracking_number, :string
    add_column :orders, :note, :text
    add_reference :orders, :user, null: false, foreign_key: true
  end
end
