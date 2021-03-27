class CreateGroupsuserrelas < ActiveRecord::Migration[6.1]
  def change
    create_table :groupsuserrelas do |t|
      t.references :user, null: false, foreign_key: true
      t.references :groupuser, null: false, foreign_key: true

      t.timestamps
    end
  end
end
