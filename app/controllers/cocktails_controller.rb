class CocktailsController < ApplicationController
  before_action :fetch_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
  end

  def new
    @cocktail =Cocktail.new
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.new(cocktails_params)

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @cocktail.update(cocktails_params)
    redirect_to cocktail_path(@cocktail)  
  end

  def destroy
    @cocktail.destroy
    redirect_to root_path
  end

  private

  def fetch_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktails_params
    params.require(:cocktail).permit(:name)
  end

end
