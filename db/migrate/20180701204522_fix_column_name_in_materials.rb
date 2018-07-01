class FixColumnNameInMaterials < ActiveRecord::Migration[5.2]
  def change
    rename_column :materials, :name, :material_name
  end
end
