class MaterialSerializer < ActiveModel::Serializer
  attributes :id, :material_name
  has_many :recommendations
end
