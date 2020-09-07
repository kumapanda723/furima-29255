class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :detail
    validates :user
    validates :category_id
    validates :status_id
    validates :price, format: { with: /\A[0-9]+\z/, message: 'Half-width number' },
                      numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipping_date_id
  end

  belongs_to :user
  has_one :order
  
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :status
    belongs_to_active_hash :delivery_fee
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :shipping_date
  
end