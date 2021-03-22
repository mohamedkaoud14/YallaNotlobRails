class FriendsController < ApplicationController
  def index 
    # @userid = params[:id]
  @arrs = [] 
      @alls = User.all
    # @user = User.find(params[:id])
    @user = User.find(8)

    @fris =  Friendship.where(user_id: @user.id)
  end

  # def new
  #   @article = Friendshipr.new 
  # end

  # def create
  #   @article = Friendshipr.new(article_params)

  #   if @article.save
  #     redirect_to  "/friends/1"
      
  #   else
  #     render :new
  #   end
 # end
  def search 
      @alls = User.all
    
      @item = params[:q]
     @alls.each do |all|
        
        if  @item == all.email 
          Friendship.new(user_id:8 , friend_id:all.id).save 
          @asd = @userid
          redirect_to  "/friends/8"
        end
      end 
  end

    def destroy
      @ID = params[:id]
      #  @deleteitemInUser = Friendship.find(4)
       @deleteitemInUser = Friendship.where(friend_id:params[:id] )

      @deleteitemInUser.destroy
  
      redirect_to "/friends/6"
    end

  # private
  #   def article_params
  #     params.require(:friendshipr).permit(:email)
  #   end
end

