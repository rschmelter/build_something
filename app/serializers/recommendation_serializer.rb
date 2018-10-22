class RecommendationSerializer < ActiveModel::Serializer
  attributes :id, :name, :cost, :buy
  belongs_to :material

end
