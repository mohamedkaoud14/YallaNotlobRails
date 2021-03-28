class GroupusersController < ApplicationController
    def index
     $groupusers=Groupuser.all
     $groupuserss=Groupsuserrela.all
    end 

    def new

       $groupusers=Groupuser.all
     $groupuserss=Groupsuserrela.all
     $groupuser= Groupuser.new
         $groupusersfrel=Groupsuserrela.new
          $userfind=0;
          
        $friendsarr =[]
         $currentuserfriendsnamer=[]
      $nocurrentuserfriendsnamer=[]
          $currentuserfriendsnamer=[]
      $nocurrentuserfriendsnamer=[]
        $currentuserfriends=Friendship.where(user_id:params[:user_id])

           $currentuserfriends.each do |user| 
          $currentuserfriendsnamer<<(User.where(id: user.friend_id))
        end
  
       

      

        $groupuser= Groupuser.new(group_name:params[:group_name])
        $groupuser.save
        $groupusersfrel =Groupsuserrela.new


      $groupuser= Groupuser.new(group_name:params[:group_name])
        $groupuser.save

        $fgroup=Groupuser.where(group_name:params[:group_name])
      $userss=User.all
        # $groupuserf = Groupuser.find_by(id:params[:account_id])
        
        $groupusersf =Groupsuserrela.where(groupuser_id:params[:account_id])
        $groupuserexist=Groupsuserrela.find_by(user_id:params[:addfriend_id],groupuser_id:params[:groupid])
        if($groupuserexist)
          redirect_to "/groupusers/new"
        else 
        $Adduser=Groupsuserrela.new(user_id:params[:addfriend_id],groupuser_id:params[:groupid]).save
        end


       
        
        #  redirect_to "/groupusers/new"
          
        #   else

        #     edirect_to "/groupusers/new"
        # end



        $arr =[]

       
        $groupusersf.each do |groupusersf| 
          $arr<<(User.where(id: groupusersf.user_id))
        end

        #  $groupusersf.each do |groupusersf| 
        #    $nocurrentuserfriendsnamer<<Friendship.where.not(friend_id:groupusersf.user_id)

        #  end
         

        $currentgroupusers=[]
        $friendgroups=Groupsuserrela.where(user_id:current_user.id)
        $friendgroups.each do |curntgroup|
        $currentgroupusers<<Groupuser.where(id:curntgroup.groupuser_id )
         end
 
          

         end




      def create
     
      $groupuser= Groupuser.new(group_name:params[:group_name])
      $groupuser.save
      $groupusersfrel =Groupsuserrela.new(user_id:current_user.id,groupuser_id:$groupuser.id).save
     
       
         
       
    
        if $groupuser.save  {
        
        
   
        # redirect_to "/groupusers/new"
        respond_to do |format|
          format.js
        end
      }
        # else
        #   render :new
        end



               $groupusers=Groupuser.all
     $groupuserss=Groupsuserrela.all
     $groupuser= Groupuser.new
         $groupusersfrel=Groupsuserrela.new
          $arr =[]
          $userfind=0;
          
        $friendsarr =[]
         $currentuserfriendsnamer=[]
      $nocurrentuserfriendsnamer=[]
          $currentuserfriendsnamer=[]
      $nocurrentuserfriendsnamer=[]
        $currentuserfriends=Friendship.where(user_id:params[:user_id])

           $currentuserfriends.each do |user| 
          $currentuserfriendsnamer<<(User.where(id: user.friend_id))
        end
  
       

      

        $groupuser= Groupuser.new(group_name:params[:group_name])
        $groupuser.save
        $groupusersfrel =Groupsuserrela.new


      $groupuser= Groupuser.new(group_name:params[:group_name])
        $groupuser.save

        $fgroup=Groupuser.where(group_name:params[:group_name])
      $userss=User.all
        # $groupuserf = Groupuser.find_by(id:params[:account_id])
        
        $groupusersf =Groupsuserrela.where(groupuser_id:params[:account_id])
        $groupuserexist=Groupsuserrela.find_by(user_id:params[:addfriend_id],groupuser_id:params[:groupid])
        if($groupuserexist)
          redirect_to "/groupusers/new"
        else 
        $Adduser=Groupsuserrela.new(user_id:params[:addfriend_id],groupuser_id:params[:groupid]).save
        end


       
        
        #  redirect_to "/groupusers/new"
          
        #   else

        #     edirect_to "/groupusers/new"
        # end



         
       
        $groupusersf.each do |groupusersf| 
          $arr<<(User.where(id: groupusersf.user_id))
        end

        #  $groupusersf.each do |groupusersf| 
        #    $nocurrentuserfriendsnamer<<Friendship.where.not(friend_id:groupusersf.user_id)

        #  end
         

        $currentgroupusers=[]
        $friendgroups=Groupsuserrela.where(user_id:current_user.id)
        $friendgroups.each do |curntgroup|
        $currentgroupusers<<Groupuser.where(id:curntgroup.groupuser_id )
         end

      end


       def destroy
       $Groupsuserrelaf = Groupuser.find_by(id:params[:account_id])
        
        $Groupsuserrelaf.destroy
        
        # redirect_to "/groupusers/new"
         respond_to  do |format|
        format.js
      end 
        end
 
 def edit
 
        $delGroupsuserrelaf = Groupsuserrela.find_by(user_id:params[:delfriend_id])
        # $Groupsuserrelaf.destroy
        $delGroupsuserrelaf.destroy

        redirect_to "/groupusers/new"
 end
 
 def add
    
                  # redirect_to "/groupusers/new"
                    respond_to  do |format|
        format.js
 end 
 end

 def show 


 
     $currentuserfriendsnamer=[]
      $nocurrentuserfriendsnamer=[]
          $currentuserfriendsnamer=[]
      $nocurrentuserfriendsnamer=[]
        $currentuserfriends=Friendship.where(user_id:params[:user_id])

           $currentuserfriends.each do |user| 
          $currentuserfriendsnamer<<(User.where(id: user.friend_id))
        end

         respond_to  do |format|
        format.js
 end 


end

def display
    $groupusersfrel=Groupsuserrela.new
    $groupusersf =Groupsuserrela.where(groupuser_id:params[:account_id])

    $arr =[]

       
        $groupusersf.each do |groupusersf| 
          $arr<<(User.where(id: groupusersf.user_id))
        end


end
def add
  #  $groupusersf =Groupsuserrela.where(groupuser_id:params[:account_id])
        $groupuserexist=Groupsuserrela.find_by(user_id:params[:addfriend_id],groupuser_id:params[:groupid])
        if(!($groupuserexist))
        #   # redirect_to "/groupusers/new"
          
        #  end
        # else 
        $Adduser=Groupsuserrela.new(user_id:params[:addfriend_id],groupuser_id:params[:groupid]).save
       
       
      end
             respond_to  do |format|
        format.js
 end 

    
end
end
 
