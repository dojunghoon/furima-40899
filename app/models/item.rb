class Item < ApplicationRecord
  belongs_to :user
  has_one :buyer
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date


  validates :name, :description, :category_id, :condition_id, :shipping_cost_id,
            :prefecture_id, :shipping_date_id, :image, presence: true

  validates :category_id, :condition_id, :shipping_cost_id, :prefecture_id, 
            :shipping_date_id, numericality: { other_than: 1 , message: "can't be blank" } 

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "is out of setting range" }

  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :shipping_cost_id
    validates :shipping_date_id
    validates :prefecture_id

end

def sold_out?
  self.buyer.present? # 'buyer'は購入者がいる場合に設定される関連です
end

end