class Address < ApplicationRecord
  with_options presence: true do
    validates :phone
    validates :address_line
    validates :user
    validates :city
    validates :postal_code
    validates :order
  end

  belongs_to :order
end
