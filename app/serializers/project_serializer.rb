class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :project_type, :cost, :user_id, :instructions
  has_many :project_materials
  has_many :materials, through: :project_materials
end
