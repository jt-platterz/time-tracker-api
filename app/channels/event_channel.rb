class EventChannel < ApplicationCable::Channel
  def subscribed
    stream_from "events:#{params[:date]}"
  end

  def unsubscribed
    stop_all_streams
  end
end