class OrdersController < ApplicationController
  def index
  end
end

def new
  @Order = Orders.new
end

def create
  @Order = Orders.new(order_params)

  if @Order.save
    redirect_to @Order
  else
    render :new
  end
end

def order_params
  params.require(:Order).permit(:type,:restaurant_name)
  # .merge!(
  #   user_id: current_user.id
  # )
end
