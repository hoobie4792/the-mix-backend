class Api::V1::CocktailsController < ApplicationController
    def index
        cocktails = Cocktail.get_cocktails(params['q'])
        render json: cocktails
    end

    def show
        cocktail = Cocktail.find(params[:id])
        render json: cocktail, include: :creator
    end 

    def create
        cocktail = Cocktail.new(name: params['name'], image: params['image'])
        cocktail.save
        render json: cocktail
    end

    def search_by_char
        cocktails = Cocktail.get_cocktails(params['q'])
        render json: cocktails
    end
end
