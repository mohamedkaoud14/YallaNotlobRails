class CreateUserInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :user_invitations do |t|
      t.references :order, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
