class CreateGroupusers < ActiveRecord::Migration[6.1]
  def change
    create_table :groupusers do |t|
      t.string :group_name

      t.timestamps
    end
  end
end
