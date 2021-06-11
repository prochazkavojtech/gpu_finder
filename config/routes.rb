Rails.application.routes.draw do
  root to: 'graphic_cards#index'

  mount ActionCable.server, at: '/cable'
end
