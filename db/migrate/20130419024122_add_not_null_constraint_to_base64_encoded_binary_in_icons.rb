class AddNotNullConstraintToBase64EncodedBinaryInIcons < ActiveRecord::Migration
  def up
    change_column :icons, :base64_encoded_binary, :text, null: false, limit: 20480
  end

  def down
    change_column :icons, :base64_encoded_binary, :text, limit: 20480
  end
end
