class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :project_type, :cost
end
