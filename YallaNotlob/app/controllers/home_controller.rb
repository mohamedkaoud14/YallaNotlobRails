class HomeController < ApplicationController

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
end
