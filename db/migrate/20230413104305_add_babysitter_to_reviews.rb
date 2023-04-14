class AddBabysitterToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :babysitter, null: false, foreign_key: true
  end
end
