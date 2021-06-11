class CardsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "cards_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
