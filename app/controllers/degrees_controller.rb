class DegreesController < ApplicationController
  def index
    @degrees = Degree.all
  end
  
  def show
    @degree = Degree.find(params[:id])
  end
  
  def new
  end
  
  def create
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  def degree_params
    params.require(:degree).permit()
  end
end