class Shoe < ActiveRecord::Base
  # has_many :result
  belongs_to :brand

  validates :name, presence :true
  validates :brand_id, presence :true
  validates :description, presence :true
  validates :photo_url, presence :true
end
