class ChefsController < ApplicationController
  before_action :set_chef, only: [:show, :edit, :update, :destroy]
  
  def index
  end

  def show
    p "______________"
    p "______________"
    p "show"
    p "______________"

  end

  def new
    @chef = Chef.new
    p "______________"
    p "______________"
    p "new"
    p "______________"

  end

  def create
    p "______________"
    p "______________"
    p "create"
    p "______________"

    @chef = Chef.new(chef_params)
    if @chef.save 
      flash[:success] = "Welcome to the Sample App!"
      redirect_to showChef_path(id: @chef.id)
    else
      render action: :new
    end
  end

  private 
  def chef_params
    params.require(:chef).permit(:name, :mail, :password, :password_confirmation)
  end

  def set_chef
    @chef = Chef.find(params[:id])
  end
end
