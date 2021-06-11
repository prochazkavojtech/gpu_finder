desc "This task is called by the Heroku scheduler add-on"
task :update_graphics => :environment do
  GraphicCard.generate_alfa
  GraphicCard.generate_alza
  GraphicCard.generate_czc
end