class CreateGroupinvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :groupinvitations do |t|
      t.references :order, null: false, foreign_key: true
      t.references :groupuser, null: false, foreign_key: true

      t.timestamps
    end
  end
end
