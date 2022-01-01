class BachelorettesController < ApplicationController 

  def show 
    @bachelorette = Bachelorette.find(params[:id])
  end

  def contestants 
    @bachelorette = Bachelorette.find(params[:id])

    @contestants = @bachelorette.contestants
  end

end
