class SubcategorySerializer < ActiveModel::Serializer
  attributes :id, :title, :category_id

  belongs_to :category
end
