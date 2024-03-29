class DosesController < ApplicationController
  before_action :set_cocktails, only: [:new, :create]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail), notice: 'Dose was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    redirect_to cocktail_path(@dose.cocktail)
    @dose.destroy
  end

private

  def set_cocktails
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
