class AddFriendshipuserInvitationToFriendship < ActiveRecord::Migration[6.1]
  def change
    add_column :friendships, :user_invitation, :boolean
  end
end
