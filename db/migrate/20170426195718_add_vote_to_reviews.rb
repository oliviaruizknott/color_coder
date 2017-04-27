class AddVoteToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :votes_total, :integer, null: false, default: 0
  end
end
