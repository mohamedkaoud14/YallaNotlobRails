class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :group_name
      t.references :User, null: false, foreign_key: true
      t.references :Order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
