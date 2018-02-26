class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :datetime, :subcategory_id, :category_id
end
