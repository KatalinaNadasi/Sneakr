class Shoe < ActiveRecord::Base
  belongs_to :brand
  has_many :results

  validates :name, presence: true, uniqueness: true
  validates :brand_id, presence: true
  validates :description, presence: true

  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

end
