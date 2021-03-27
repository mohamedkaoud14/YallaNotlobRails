class GroupusersController < ApplicationController
    def index
     @groupusers=Groupuser.all
     @groupuserss=Groupsuserrela.all
    end 

    def new
       @groupusers=Groupuser.all
     @groupuserss=Groupsuserrela.all
     @groupuser= Groupuser.new
         @groupusersfrel=Groupsuserrela.new
          @arr =[]
        @friendsarr =[]

        @groupuser= Groupuser.new(group_name:params[:group_name])
        @groupuser.save
        @groupusersfrel =Groupsuserrela.new


      @groupuser= Groupuser.new(group_name:params[:group_name])
        @groupuser.save

        @fgroup=Groupuser.where(group_name:params[:group_name])
      @userss=User.all

        
       
     
       
        

        # @groupuserf = Groupuser.find_by(id:params[:account_id])
  
        @groupusersf =Groupsuserrela.where(groupuser_id:params[:account_id])

         
       
        @groupusersf.each do |groupusersf| 
          @arr<<(User.where(id: groupusersf.user_id))
        end

        @currentgroupusers=[]
        @friendgroups=Groupsuserrela.where(user_id:current_user.id)
        @friendgroups.each do |curntgroup|
        @currentgroupusers<<Groupuser.where(id:curntgroup.groupuser_id )
         end

         end


      def create
     

      @groupuser= Groupuser.new(group_name:params[:group_name])
      @groupuser.save
      @groupusersfrel =Groupsuserrela.new(user_id:current_user.id,groupuser_id:@groupuser.id).save

       

         
       

    
        if @groupuser.save  {
        
        
   
        redirect_to "/groupusers/new"
      }
        else
          render :new
        end
      end





       def destroy
       @Groupsuserrelaf = Groupuser.find_by(id:params[:account_id])
        

        @Groupsuserrelaf.destroy
        
        redirect_to "/groupusers/new"
        end
 
 def edit
 
        @delGroupsuserrelaf = Groupsuserrela.find_by(user_id:params[:delfriend_id])

      
        @delGroupsuserrelaf.destroy
        redirect_to "/groupusers/new"
 end
end
