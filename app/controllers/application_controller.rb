# Base controller for all other controllers to inherit from.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
