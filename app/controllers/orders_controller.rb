class OrdersController < ApplicationController
  def index
    @orders = Order.all
    render json: @orders, status: :ok
  end

  def show
    @order = Order.find(params[:id])
    render json: @order, status: :ok
  end

  def create
    @order = Order.new(order_create_params)
    items = @order.items
    items.each do |item|
      OrderItem.create({
        order_id: @order.id,
        quantity: item.quantity,
        price: item.price,
        item_id: item.id,
      })
    end
    if @order.save
      render json: {
        message: "Order created successfully",
      }, status: :created
    else
      render json: {
               error_message: "Oops! Order creation failed",
               errors: @order.errors_full_messages,
             }, status: :unprocessable_entity
    end
  end

  def update
    @order = Order.find(params[:id])
    if order.update(order_update_params)
      render json: {
               message: "Order updated successfully",
             }, status: :ok
    else
      render json: {
               error_message: "Sorry! Could not update order, Please try again later",
               errors: @order.errors_full_messages,
             }, status: :unprocessable
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    render jsone: {
             message: "Order deleted successfully",
           }, status: :ok
  end

  private

  def order_create_params
    params.require(:order).permit(:order_status, :payment_status, :shipping_address, :billing_address, :shipping_method, :tracking_number, :total_price, :note, :items)
  end

  def order_update_params
    params.require(:order).permit(:shipping_address, :billing_address, :shipping_method, :note)
  end
end
