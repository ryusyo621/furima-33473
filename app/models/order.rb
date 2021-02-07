class Order
  include ActiveModel::Model
  attr_accessor :post_number, :area_id, :city, :address, :building, :phone_number, :token, :item_id, :user_id

  # ここにバリデーションの処理を書く

  with_options presence: true do
    validates :post_number, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :area_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, length: { maximum: 11 }, format: { with: /\A[0-9]+\z/ }
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Delivary.create(post_number: post_number, area_id: area_id, city: city, address: address, building: building,
                    phone_number: phone_number, purchase_id: purchase.id)
  end
end
