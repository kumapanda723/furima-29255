class AddSoldStatusToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :sold_status, :integer
  end
end
