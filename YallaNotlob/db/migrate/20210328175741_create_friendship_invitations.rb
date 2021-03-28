class CreateFriendshipInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :friendship_invitations do |t|
      t.boolean :status
      t.boolean :joined
      t.bigint :friend_id
      t.references :user, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
