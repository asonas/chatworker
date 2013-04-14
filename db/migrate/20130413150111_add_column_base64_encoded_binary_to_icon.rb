class AddColumnBase64EncodedBinaryToIcon < ActiveRecord::Migration
  def change
    add_column :icons, :base64_encoded_binary, :text, limit: 20 * 1024
    add_column :icons, :content_type, :string
  end
end
