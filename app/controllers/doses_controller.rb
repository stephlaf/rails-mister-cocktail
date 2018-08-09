class DosesController < ApplicationController
  

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    # raise
  end

  def create
    # @ingredient = Ingredient.find(doses_params[:dose][:ingredient_id])
    # @dose = Dose.new({ description: params[:dose][:description], cocktail: @cocktail, ingredient: @ingredient })
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(doses_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
