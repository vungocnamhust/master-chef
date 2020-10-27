module SessionsHelper
  def log_in(chef)
    session[:chef_id] = chef.id    
  end

  def current_chef
    @current_chef ||= Chef.find_by(id: session[:chef_id]) if session[:chef_id]
  end

  def logged_in?
    !current_chef.nil?
  end

  def log_out
    session.delete(:chef_id)
    @current_chef = nil
  end
end
