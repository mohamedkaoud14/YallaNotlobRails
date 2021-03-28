class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :order_type
      t.string :restaurant_name
      t.string :img
      t.string :status
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
