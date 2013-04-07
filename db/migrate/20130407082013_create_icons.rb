class CreateIcons < ActiveRecord::Migration
  def change
    create_table :icons do |t|
      t.string :class_name
      t.string :icon_url

      t.timestamps
    end
    add_index :icons, :class_name
  end
end
