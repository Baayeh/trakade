class ItemsController < ApplicationController
  before_action :set_item, only: %i[show update destroy]

  def index
    items = Item.all
    render json: items
  end

  def show
    render json: @item
  end

  def create
    item = Item.new(item_params)

    if item.save
      render json: {
        item: item,
        message: "Item created successfully",
      }, status: :created
    else
      render json: {
        error_message: "Item creation failed",
        errors: item.errors.full_messages,
      }, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      render json: {
        item: @item,
        message: "Item updated successfully",
      }, status: :ok
    else
      render json: {
        message: "Item was not successfully updated",
        errors: @item.errors.full_messages,
      }, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :sku, :price, :quantity, :category_id)
  end
end
