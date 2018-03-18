class Event < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :title, :category_id, :datetime, presence: true

  scope :for_date, -> (date = nil) do
    if date.nil?
      return Event.none
    end

    start_datetime = date.beginning_of_day
    end_datetime = start_datetime.end_of_day

    where('events.datetime >= ? AND events.datetime < ?', start_datetime, end_datetime)
  end

  after_commit :publish_update, on: [:create, :update]
  after_commit :publish_destroy, on: :destroy

  def category_id
    category&.id
  end

private

  def publish_update
    params = {event: self, type: id_changed? ? 'created' : 'updated'}
    ActionCable.server.broadcast("events:#{datetime.strftime('%Y-%m-%d')}", params)
  end

  def publish_destroy
    params = {event_id: self.id, type: 'destroy'}
    ActionCable.server.broadcast("events:#{datetime.strftime('%Y-%m-%d')}", params)
  end

end
