class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :orderType
      t.string :restaurant_name
      t.references :User, null:   true, foreign_key: true

      t.timestamps
    end
  end
end
