class CategoriesController < ApplicationController
  def index
    # display all
    @categories = Category.all
    render json: @categories, status: :ok
  end

  def show
    # display by search 1
    @category = Category.find(params[:id])
    render json: @category, status: :ok
  end

  def create
    @category = Category.new(category_create_params)
    if @category.save
      render json: {
        message: "Category created successfully",
      }, status: :created
    else
      render json: {
               error: @category.errors_full_messages, error: "Something went wrong",
             }, status: :unprocessable_entity
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_update_params)
      render json: {
        message: "Category updated successfully",
      }, status: :ok
    else
      render json: {
        errors: @category.errors_full_messages, error: "Something went wrong",
      }, status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    render json: {
      message: "Category deleted successfully",
    }, status: :ok
  end

  private

  def category_create_params
    params.require(:category).permit(:name, :sku)
  end

  def category_update_params
    params.require(:category).permit(:name)
  end
end
