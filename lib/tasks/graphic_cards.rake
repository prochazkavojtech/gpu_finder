namespace :graphic_cards do
  desc "update graphic cards"
  task :update => :environment do
    GraphicCard.generate_alfa
    GraphicCard.generate_alza
    GraphicCard.generate_czc
  end
end