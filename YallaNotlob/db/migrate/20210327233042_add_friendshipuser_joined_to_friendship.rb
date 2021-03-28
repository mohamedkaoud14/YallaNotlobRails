class AddFriendshipuserJoinedToFriendship < ActiveRecord::Migration[6.1]
  def change
    add_column :friendships, :user_joined, :boolean
  end
end
