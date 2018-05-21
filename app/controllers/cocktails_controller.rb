class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :destroy]
  def index
    @cocktails = Cocktail.all
  end

  def show
    @doses = Dose.where('cocktail_id = ?', @cocktail.id)
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private
  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :doses, :photo)
  end
end
