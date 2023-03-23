class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :age
      t.string :house
      t.boolean :available
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
