class Icon < ActiveRecord::Base
  attr_accessible :class_name, :icon_url

  validates :class_name, presence: true
  validates :icon_url, presence: true

  def base64_encoded_data
    "data:#{self.content_type};base64,#{self.base64_encoded_binary}"
  end
end
