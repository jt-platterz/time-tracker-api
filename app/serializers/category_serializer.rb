class CategorySerializer < ActiveModel::Serializer
  attributes :id, :title, :color

  has_many :subcategories
end
