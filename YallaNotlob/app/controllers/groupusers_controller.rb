class GroupusersController < ApplicationController
    def index
    @groupusers=Groupuser.all
    end 

    def new
        @groupuser= Groupuser.new
      end
    
      def create

        @groupuser = Groupuser.new(group_name:params[:group_name])
        if @groupuser.save
          redirect_to "/groupusers/new"
        else
          render :new
        end
      end


end
