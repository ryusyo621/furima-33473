class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :product_name
    validates :product_text
    validates :category_id
    validates :state_id
    validates :burden_id
    validates :area_id
    validates :shiping_id
    validates :price
  end
end
