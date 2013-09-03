class ApplicationController < ActionController::Base
  protect_from_forgery
  # REVIEW: I prefer this pattern rather than including a view helper
  include Authentication

  helper_method :current_user
end
