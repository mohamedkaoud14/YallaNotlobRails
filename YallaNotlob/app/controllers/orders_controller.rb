class OrdersController < ApplicationController
  def index
    @orders=Order.all
  end

  def new
    @order=Order.new
    @orders=Order.all
    @friends=Friend.all
    @friend =Friend.where(users_id:current_user.id)
    @arr=[]
    @friend.each do |friendf| 
      @arr<<(User.where(id: friendf.friend_id).pluck(:username))
    end

  end

  def create
    @order=Order.new(order_type:params[:order_type],restaurant_name:params[:restaurant_name])

    if @order.save
      redirect_to "/orders/new"
    else
      render :new
    end
  end

   
  
end
