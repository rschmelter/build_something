class AddBuyToRecommendations < ActiveRecord::Migration[5.2]
  def change
    add_column :recommendations, :buy, :string
  end
end
