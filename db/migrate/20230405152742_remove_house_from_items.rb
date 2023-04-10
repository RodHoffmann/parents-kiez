class RemoveHouseFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :house, :string
  end
end
