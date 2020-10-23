class SessionsController < ApplicationController
  def new
  end

  def create 
    chef = Chef.find_by(mail: params[:session][:mail].downcase) 
    if chef && chef.authenticate(params[:session][:password])
        redirect_to recipes_path
    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render action: 'new' 
    end
  end

  def destroy
  end

end
