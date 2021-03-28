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
    @user_invite =Friendship.where(friend_id:params[:friendd_id])
    @user_invite.update(user_invitation:1)
    @friedsinvited=Friendship.where(user_invitation:1,user_id:current_user.id)

    @invitedfriends=[]
    @friedsinvited.each do |friendf| 
      @invitedfriends<<User.where(id:friendf.friend_id)

      
      
    end

    @uninvtefriend=Friendship.where(friend_id:params[:invite_id])
    @uninvtefriend.update(user_invitation:0)
   


  end

  def show
    @univite=Friendship.where(friend_id:params[:account_id])
    @uninvite.update(user_invitation:0)


  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
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
