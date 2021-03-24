class GroupusersController < ApplicationController
    def index
     @groupusers=Groupuser.all
     @groupuserss=GroupUser.all
    end 

    def new
        @groupuser= Groupuser.new
        @groupusers=Groupuser.all

      end
    
      def create

        @groupuser = Groupuser.new(group_name:params[:group_name])
        if @groupuser.save
          redirect_to "/groupusers/new"
        else
          render :new
        end
      end

       def show
       @groupuserf = Groupuser.find_by(id:params[:account_id])

        @groupuserf.destroy
        redirect_to root_path
        end

        def edit
           @arr =[]
      
        @groupuserf = Groupuser.find_by(id:params[:account_id])
        # @groupusersf =GroupUser.find_by(groupusers_id:params[:account_id])
        @groupusersf =GroupUser.where(groupusers_id:params[:account_id])
        # @userfind=User.find_by(id: @groupusersf.user_id)
        # @userfind=User.all(:conditions => "id ='1'")
        @groupusersf.each do |groupusersf| 
          @arr<<(User.where(id: groupusersf.user_id).pluck(:username))
        end

        
                #  redirect_to "/groupusers/new"

        end


end
