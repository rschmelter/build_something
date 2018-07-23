class Project < ActiveRecord::Base 
  belongs_to :user
  has_many :project_materials 
  has_many :materials, :through => :project_materials

  validates :name, presence: true
  validates :project_type, presence: true
  validates :cost, presence: true
  validates :cost, numericality: {only_integer: true}
  validates :difficulty, presence: true
  validates :difficulty, inclusion: 1..5
  validates :instructions, presence: true

 

  def materials_attributes=(materials_attributes)
    materials_attributes.values.each do |v|
      if v[:material_name].present? 
        material_name = v[:material_name].downcase
        material = Material.find_or_create_by(material_name: material_name)
        material.update(tool: v[:tool])
      elsif v[:id].present? 
        material = Material.find_by(id: v[:id])
      end 
      if v[:project_materials][:quantity].present? || v[:project_materials][:size].present?
        ProjectMaterial.create(quantity: v[:project_materials][:quantity], size: v[:project_materials][:size], project: self, material: material)
      end

    end
  end



  def self.order_by_easy
    self.order(:difficulty)
  end

  def self.order_by_hard 
    self.order(difficulty: :desc)
  end

  def self.cheap
    self.order(:cost)
  end 

  def self.expensive 
    self.order(cost: :desc)
  end 

  def tool 
    self.materials.select {|m| m.tool == true}
  end 

  

  def clear_materials
    self.materials.delete_all
  end

  def delete_material(name)
    material = self.materials.delete(Material.find_by(material_name: name))

  end 

end