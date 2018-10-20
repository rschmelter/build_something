class RemoveExplanationFromRecommendations < ActiveRecord::Migration[5.2]
  def change
    remove_column :recommendations, :explanation, :string
  end
end
