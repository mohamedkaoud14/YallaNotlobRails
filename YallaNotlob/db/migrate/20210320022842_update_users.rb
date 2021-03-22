class UpdateUsers < ActiveRecord::Migration[6.1]
  def change
    add_column(:users, :provider, :string, limit: 50, null: true, default: '') 
    add_column(:users, :uid, :string, limit: 500, null: false, default: '') 
    # add_column(:users, :image, :string, limit: 500, null: false, default: '/img/default.png') 

    # add_column(:users, :image, :string, limit: 500, null: false, default: '/img/default.png') 

  end
end
