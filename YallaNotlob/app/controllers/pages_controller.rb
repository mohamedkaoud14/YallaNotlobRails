class PagesController < ApplicationController
  def myaccount
    @friedsinvited=Friendship.where(user_invitation:1,friend_id:current_user.id)
    @currentuserorder=Order.where(user_id:current_user.id)

    @invitations=[]
    @friedsinvited.each do |friendf| 
   @invitations<<User.where(id:friendf.user_id)
    end
  end

  def index
    @users=User.all
    @orders=Order.all
@friends=Friendship.all
end

def show
 @friedsinvited=Friendship.where(user_invitation:1,friend_id:current_user.id).pluck(:user_id)

 @invitations=[]
 @friedsinvited.each do |friendf| 
@invitations<<User.where(id:friendf[0]).pluck(:username)

 end

end

def accept

 @acceptinvitation=Friendship.where(user_invitation:1,friend_id:current_user.id,user_id:params[:accept_id])


 @acceptinvitation.update(user_joined:1,user_invitation:0)
 redirect_to root_path
end

def destroy
  @acceptinvitation=Friendship.where(user_invitation:1,friend_id:current_user.id,user_id:params[:accept_id])


 @acceptinvitation.update(user_joined:0,user_invitation:0)
 redirect_to root_path

end


end

