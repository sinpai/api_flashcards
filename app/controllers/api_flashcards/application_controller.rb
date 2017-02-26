module ApiFlashcards
  class ApplicationController < ActionController::Base
    before_action :require_login_from_http_basic
  end
end
