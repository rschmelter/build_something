class Project < ActiveRecord::Base 
  belongs_to :user
  has_many :project_materials
  has_many :materials, :through => :project_materials

  accepts_nested_attributes_for :materials
  accepts_nested_attributes_for :project_materials



  def clear_materials
    self.materials.delete_all
  end

  def add_materials(params)
    clear_materials
    params[:project_materials_attributes].values.each do |v|
      if v[:material][:material_name].present?
        material_name = v[:material][:material_name].downcase
        material = Material.find_or_create_by(material_name: material_name)
        material.update(tool: v[:material][:tool])
      elsif v[:material_id].present?
        material = Material.find_by(id: v[:material_id])
      end 

      if v[:quantity].present? && v[:size].present?
        project_material = ProjectMaterial.create(quantity: v[:quantity], size: v[:size], material_id: material.id, project_id: self.id)
     
      end
    end
  end

end