class ChefsController < ApplicationController

  def show
    @chef = Chef.find(param[:id])
  end

  def new
  end
end
