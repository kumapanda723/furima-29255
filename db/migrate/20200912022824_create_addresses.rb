class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :phone,                  null: false
      t.string     :building
      t.text       :address_line,           null: false
      t.text       :city,                   null: false
      t.text       :postal_code,            null: false
      t.references :order,                  null: false, foreign_key: true
      t.timestamps
    end
  end
end
