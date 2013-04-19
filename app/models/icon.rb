class Icon < ActiveRecord::Base
  attr_accessible :class_name

  validates :class_name, presence: true

  def base64_encoded_data
    "data:#{self.content_type};base64,#{self.base64_encoded_binary}"
  end
end
