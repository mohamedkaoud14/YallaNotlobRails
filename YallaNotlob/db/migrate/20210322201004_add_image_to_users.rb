class AddImageToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :image, :string, :default => "/img/default.png"
  end
end
