class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :type
      t.string :restaurant_name
      t.references :User, null: false, foreign_key: true

      t.timestamps
    end
  end
end
