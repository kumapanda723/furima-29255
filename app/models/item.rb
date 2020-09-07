class Item < ApplicationRecordend
  belongs_to :user
  has_one :order
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date
end