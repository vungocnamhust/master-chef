# Handle session for login

class SessionsController < ApplicationController
  include SessionsHelper

  def new; end

  def create
    chef = Chef.find_by(mail: params[:session][:mail].downcase)
    if chef&.authenticate(params[:session][:password])
      log_in(chef)
      params[:session][:remember_me] == '1' ? remember(chef) : forget(chef)
      redirect_to recipes_path
    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render action: 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
