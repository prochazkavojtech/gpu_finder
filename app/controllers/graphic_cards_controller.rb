class GraphicCardsController < ApplicationController
  def index
    @graphic_cards = GraphicCard.where.not(stock: ['Těšíme se', 'Neni k dispozici'])
  end
end
