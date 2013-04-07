class Icon < ActiveRecord::Base
  attr_accessible :class_name, :icon_url

  validates :class_name, presence: true
  validates :icon_url, presence: true
end
