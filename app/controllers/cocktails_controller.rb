class CocktailsController < ApplicationController
  def index
    @cocktails  =Cocktail.all
  end

  def show
    @cocktails  =Cocktail.find(cocktails_params)
  end

  def new
    @cocktails  =Cocktail.new
  end

  def create
    @cocktails  =Cocktail.new(cocktails_params)

    if @cocktails.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def cocktails_params
    params.require(:cocktail).permit(:name)
  end

end
