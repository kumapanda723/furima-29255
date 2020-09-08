class Item < ApplicationRecord

  with_options presence: true do
    validates :name, length: {maximum: 40}
    validates :detail, length: {maximum: 1000}
    validates :user
    validates :category_id, numericality: { other_than: 0, message: 'Select' } 
    validates :status_id, numericality: { other_than: 0, message: 'Select' }  
    validates :price, format: { with: /\A[0-9]+\z/, message: 'Half-width number' },
                      numericality: { only_integer: true, greater_than: 299, less_than: 10000000 , message: 'Out of setting range'}
    validates :delivery_fee_id, numericality: { other_than: 0, message: 'Select' } 
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' } 
    validates :shipping_date_id, numericality: { other_than: 0, message: 'Select' } 
    validates :img
  end

  belongs_to :user
  has_one :order
  has_one_attached :img
  
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :status
    belongs_to_active_hash :delivery_fee
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :shipping_date
  
end