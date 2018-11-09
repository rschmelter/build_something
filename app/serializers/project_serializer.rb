class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :project_type, :cost, :user_id, :difficulty, :instructions
  has_many :project_materials
  has_many :materials
end
