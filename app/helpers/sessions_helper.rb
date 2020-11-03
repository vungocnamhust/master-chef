module SessionsHelper
  def log_in(chef)
    session[:chef_id] = chef.id
  end

  def current_chef
    # Check id based on session
    if (chef_id = session[:chef_id])
      p '###### Check chef_id based on id of session'
      @current_chef ||= Chef.find_by(id: chef_id)
      # Check id based on id encrypted of cookies
    elsif (chef_id = cookies.encrypted[:chef_id])
      p '###### Check chef_id based on id encrypted of cookies'
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
    session.delete(:chef_id)
    @current_chef = nil
  end

  def remember(chef)
    chef.remember
    cookies.permanent.encrypted[:chef_id] = chef.id
    cookies.permanent[:remember_token] = chef.remember_token
  end
end
