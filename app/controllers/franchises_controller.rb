class FranchisesController < ApplicationController 
  before_action :require_login

  def index 
    @franchises = Franchise.all
  end

  def show 
    @franchise = find
    @rating = current_user.rating_by_franchise(@franchise)  
  end

  def new 
    @franchise = Franchise.new 
  end

  def create 
    @franchise = Franchise.new(franchise_params)
    if @franchise.valid?
      @franchise.save
      redirect_to franchise_path(@franchise) 
    else
      redirect_to new_franchise_path
    end
  end

  private 

  def find 
    Franchise.find(params[:id])
  end

  def franchise_params 
    params.require(:franchise).permit(:name, :medium)
  end
end