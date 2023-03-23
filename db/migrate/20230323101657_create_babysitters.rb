class CreateBabysitters < ActiveRecord::Migration[7.0]
  def change
    create_table :babysitters do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :gender
      t.string :address
      t.float :cost_per_hour
      t.integer :years_of_experience
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
