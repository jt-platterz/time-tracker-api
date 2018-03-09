class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :datetime, :category_id, :user_id
end
