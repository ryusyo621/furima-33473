class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :state
  belongs_to :burden
  belongs_to :shiping

  with_options presence: true do
    validates :product_name
    validates :product_text
    validates :price, format: { with: /\A[0-9]+\z/ }, inclusion: { in: 300..9_999_999 }
    validates :image

    with_options numericality: { other_than: 1 } do
      validates :area_id
      validates :category_id
      validates :state_id
      validates :burden_id
      validates :shiping_id
    end
  end
end
