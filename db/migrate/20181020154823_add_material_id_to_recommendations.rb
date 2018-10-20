class AddMaterialIdToRecommendations < ActiveRecord::Migration[5.2]
  def change
    add_column :recommendations, :material_id, :integer
  end
end
