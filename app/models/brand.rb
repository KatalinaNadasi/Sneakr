class Brand < ActiveRecord::Base
  has_many :shoe

  validates :name, presence :true
  validates :photo_url, presence :true
end
