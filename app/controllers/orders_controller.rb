class OrdersController < ApplicationController
  def index
    show
  end

  def create
    @food_item = FoodItem.find(params[:food_item_id])
    @order = @food_item.orders.create(params[:order].permit(:name, :phone, :address, :quantity, :coupon))

    redirect_to food_item_order_path(@food_item.id, @order.id)
  end

  def show
    @food_item = FoodItem.find(params[:food_item_id])
    @order = @food_item.orders.find(params[:id])
  end
end
