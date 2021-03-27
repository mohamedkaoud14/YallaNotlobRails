class FriendsController < ApplicationController

  def index 
  #   # @userid = params[:id]
   @arrs = [] 
       @alls = User.all
  #    @user = User.find(params[:id])
  #   # @user = User.find(8)

  #   @fris =  Friendship.where(user_id: @user.id)
        @user = User.find(current_user.id)
           @fris =  Friendship.where(user_id: @user.id)


        


  #current_user.username
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
  # def search 
  #     @alls = User.all
    
  #     @item = params[:q]
  #    @alls.each do |all|
        
  #       if  @item == all.email 
  #         if  Friendship.new(user_id:current_user.id , friend_id:all.id).save && Friendship.new(user_id:all.id , friend_id:current_user.id).save 
           
  #         # @asd = @userid
  #         redirect_to  "/friends"
  #         end
  #       end
  #     end 
  # end


  def search 

    
    @alls = User.all
  
      @item = params[:q]
      @alls.each do |all|
      
      if  @item == all.email 
     

        if  Friendship.new(user_id:current_user.id , friend_id:all.id).save && Friendship.new(user_id:all.id , friend_id:current_user.id).save 
          
          
          @friends = Friendship.all 


 
           respond_to do |format|
          #   format.html  # index.html.erb
          #   format.json  { render :json => @alls }
             format.js 
           end
          

          # redirect_to  "/friends"       
      
        end
      end
    end 
end
      # this is destroy  !!!!!
    def destroy
      # @ID = params[:id]
        # @deleteitemInUser = Friendship.find(params[:id])
        # @deleteitemInUser.destroy

        # @deleteitemInUser1 = Friendship.find(params[:id].to_i+1) 

        # @deleteitemInUser =  Friendship.find(:)

        @deleteitemInUser =  Friendship.find_by(user_id: current_user.id, friend_id: params[:id])
        @deleteitemInUser1 =  Friendship.find_by(user_id:params[:id] , friend_id: current_user.id)

         @deleteitemInUser.destroy
         @deleteitemInUser1.destroy


         respond_to do |format|
          format.js 
          # format.html
           end


        # @deleteitemInUser = Friendship.where(friend_id:params[:id]  )

      # @deleteitemInUser1.destroy

  
      #  redirect_to "/friends"
    end
    

  # private
  #   def article_params
  #     params.require(:friendshipr).permit(:email)
  #   end
end

