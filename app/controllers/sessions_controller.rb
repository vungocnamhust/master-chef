# Handle session for login

class SessionsController < ApplicationController
  include SessionsHelper

  def new
    p '___________________'
    p '___________________'
    p 'session new'
    p '___________________'

  end

  def create
    chef = Chef.find_by(mail: params[:session][:mail].downcase)
    p '___________________'
    p '___________________'
    p chef
    p '___________________'

    if chef&.authenticate(params[:session][:password])
      log_in(chef)
      redirect_to recipes_path
    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render action: 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
