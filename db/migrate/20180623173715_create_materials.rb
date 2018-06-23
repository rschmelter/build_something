class CreateMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.string :name
      t.boolean :tool, :default => false
      t.boolean :raw_materials, :default => false
    end
  end
end
