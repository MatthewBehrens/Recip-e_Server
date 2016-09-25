require "application_responder"

class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::MimeResponds
  include ApplicationHelper
  self.responder = ApplicationResponder
  respond_to :html
  respond_to :json

  # protect_from_forgery with: :exception
end
