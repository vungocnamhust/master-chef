class ChefsController < ApplicationController
  before_action :set_chef, only: [:show, :edit, :update, :destroy]

  def index; end

  def show; end

  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      flash[:success] = 'Welcome to the Sample App!'
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
