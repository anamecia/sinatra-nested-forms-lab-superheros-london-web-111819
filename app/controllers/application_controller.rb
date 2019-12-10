require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get "/" do 
        erb :super_hero
    end 

    post "/team" do 
        @team = Team.new(params[:team])

        params[:team][:heros].each do |args|
            SuperHero.new(args)
        end 

        @super_heros = SuperHero.all

        erb :team 
    end 


end
