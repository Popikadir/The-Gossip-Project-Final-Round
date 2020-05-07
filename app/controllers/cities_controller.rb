class CitiesController < ApplicationController
    def show
        @city = City.find(params[:id])
        @gossips = Gossip.all
       # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    end
end