class AddNotNullConstraintToContentTypeInIcons < ActiveRecord::Migration
  def up
    change_column :icons, :content_type, :string, null: false
  end

  def down
    change_column :icons, :content_type, :string
  end
end
