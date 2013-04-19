class ChangeClassNameIndexInIcons < ActiveRecord::Migration
  def up
    remove_index :icons, :class_name
    add_index :icons, :class_name, unique: true
  end

  def down
    remove_index :icons, :class_name
    add_index :icons, :class_name
  end
end
