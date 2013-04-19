class Icon < ActiveRecord::Base
  attr_accessible :class_name

  validates :class_name,
    presence: true,
    uniqueness: true

  validates :base64_encoded_binary, presence: true
  validates :content_type, presence: true

  def base64_encoded_data
    "data:#{self.content_type};base64,#{self.base64_encoded_binary}"
  end
end
