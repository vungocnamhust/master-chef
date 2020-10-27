class AuthenticatedController < ApplicationController
  before_action :currentUser

  def currentUser
    # check session
    # parse session => user
    # @currentUser = user
  end
end