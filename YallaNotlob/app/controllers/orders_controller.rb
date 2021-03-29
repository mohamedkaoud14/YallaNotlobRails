class OrdersController < ApplicationController
  def index
    @order=Order.where("user_id = " + current_user.id.to_s + "")
  end

  def finish
    @a=Order.find(params[:id])
    @a.update(status: 'Finished')
    
  end

  def destroy
   @deletedOrder=Order.find_by(id: params[:order_id])
   @deletedOrder.destroy
  end
  
  def new
    @order=Order.new
    @users=User.all
    @orders=Order.all
    @friends=Friendship.all
    @friend =Friendship.where(user_id:current_user.id)


    # @arrorder=[]
    # @currentuserorder.each do |order| 
    #   @arrorder<<(User.where(id: order.friend_id).pluck(:username))
    # end
    
    @arr=[]
    @friend.each do |friendf| 
      @arr<<(User.where(id: friendf.friend_id).pluck(:username))
    end

    @invitedfriend =User.where(id:params[:friendd_id]).pluck(:username)
    @user_invite =FriendshipInvitation.where(friend_id:params[:friendd_id],order_id:[:order_id])
    @user_invite.update(status:1)
    @friedsinvited=FriendshipInvitation.where(status:1,user_id:current_user.id,order_id:params[:order_id])

    @invitedfriends=[]
    @friedsinvited.each do |friendf| 
      @invitedfriends<<User.where(id:friendf.friend_id)


      ##################user_invitaions############
     

      
      
    end

    @uninvtefriend=Friendship.where(friend_id:params[:invite_id])
    @uninvtefriend.update(user_invitation:0)
   


  end

 # def show
  #  @univite=Friendship.where(friend_id:params[:account_id])
   # @uninvite.update(user_invitation:0)


  #end

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
    @order=Order.new(order_type:params[:order_type],restaurant_name:params[:restaurant_name],user_id:current_user.id)

    if @order.save
      redirect_to "/orders/new"
    else
      render :new
    end
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
