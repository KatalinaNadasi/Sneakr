class Brand < ActiveRecord::Base
  has_many :shoes, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :photo_url, presence: true
end
