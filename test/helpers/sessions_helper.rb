# frozen_string_literal: true

module SessionsHelper
  def log_in(chef)
    session[:id] = chef.id
  end
end
