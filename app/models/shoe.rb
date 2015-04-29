class Shoe < ActiveRecord::Base
  belongs_to :brand

  validates :name, presence: true, uniqueness: true
  validates :brand_id, presence: true
  validates :description, presence: true
end
