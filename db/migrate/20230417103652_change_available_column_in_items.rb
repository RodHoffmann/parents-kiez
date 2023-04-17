class ChangeAvailableColumnInItems < ActiveRecord::Migration[7.0]
  def change
    change_column :items, :available, :boolean, default: true
  end
end
