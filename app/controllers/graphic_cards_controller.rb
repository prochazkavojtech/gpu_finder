class GraphicCardsController < ApplicationController
  def index
    @graphic_cards = GraphicCard.all
  end
end
