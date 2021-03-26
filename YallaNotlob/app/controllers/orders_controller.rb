class OrdersController < ApplicationController
  def index
    @orders=Order.all
  end

  def new
    @order=Order.new
    @users=User.all
    @orders=Order.all
    @friends=Friendship.all
    @friend =Friendship.where(user_id:current_user.id)
    @arr=[]
    @friend.each do |friendf| 
      @arr<<(User.where(id: friendf.friend_id).pluck(:username))
    end

    @invitedfriend =User.where(id:params[:friendd_id]).pluck(:username)


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
