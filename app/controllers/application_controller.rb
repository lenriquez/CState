class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  # This line was change to be able to use this as an API
  protect_from_forgery with: :null_session #protect_from_forgery with: :exception
end
