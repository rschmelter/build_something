class CreateProjectMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :project_materials do |t|
      t.belongs_to :project, foreign_key: true
      t.belongs_to :material, foreign_key: true
      t.integer :quantity
      t.string :size
    end
  end
end
