class Brand < ActiveRecord::Base
  has_many :shoes

  validates :name, presence: true
  # validates :photo_url, presence: true
end
