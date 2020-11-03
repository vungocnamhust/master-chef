module SessionsHelper
  def log_in(chef)
    session[:chef_id] = chef.id
  end

  # Check id based on session
  # When reload page & logged in
  # Because session will be delete automatically when browser relaunched
  #
  # Check id based on id encrypted of cookies
  # When restart browser
  def current_chef
    p '######################'
    p session[:chef_id]
    p cookies[:chef_id]
    p cookies.encrypted[:chef_id]
    p '######################'

    if (chef_id = session[:chef_id])
      @current_chef ||= Chef.find_by(id: chef_id)
    elsif (chef_id = cookies.encrypted[:chef_id])
      chef = Chef.find_by(id: chef_id)
      if chef&.authenticated?(cookies[:remember_token])
        log_in chef
        @current_chef = chef
      end
    end
  end

  def logged_in?
    !current_chef.nil?
  end

  def log_out
    forget(current_chef)
    session.delete(:chef_id)
    @current_chef = nil
  end

  def remember(chef)
    chef.remember_digest_token
    cookies.permanent.encrypted[:chef_id] = chef.id
    cookies.permanent[:remember_token] = chef.remember_token
  end

  def forget(chef)
    chef.forget
    cookies.delete(:chef_id)
    cookies.delete(:remember_token)
  end
end
