class RemoveIconUrlFromIcons < ActiveRecord::Migration
  def up
    remove_column :icons, :icon_url
  end

  def down
    add_column :icons, :icon_url, :string, after: :class_name
  end
end
