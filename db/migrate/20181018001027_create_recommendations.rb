class CreateRecommendations < ActiveRecord::Migration[5.2]
  def change
    create_table :recommendations do |t|
      t.string :name
      t.integer :cost
      t.string :explanation

      t.timestamps
    end
  end
end
