class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.save
    @cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      @cocktail.dose = @dose
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def delete
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail, :ingredient)
  end
end
