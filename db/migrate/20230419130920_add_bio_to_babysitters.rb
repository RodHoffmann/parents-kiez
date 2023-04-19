class AddBioToBabysitters < ActiveRecord::Migration[7.0]
  def change
    add_column :babysitters, :bio, :text
  end
end
