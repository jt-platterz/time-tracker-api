class Event < ApplicationRecord
  belongs_to :subcategory

  delegate :category, to: :subcategory, allow_nil: true

  validates :title, :subcategory_id, :datetime, presence: true

  scope :for_date, -> (date = nil) do
    if date.nil?
      return Event.none
    end

    start_datetime = date.beginning_of_day
    end_datetime = start_datetime.end_of_day

    where('events.datetime >= ? AND events.datetime < ?', start_datetime, end_datetime)
  end

  def category_id
    category&.id
  end
end
