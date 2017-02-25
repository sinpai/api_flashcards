require_relative '../../application_controller.rb'

module ApiFlashcards
  class Api::V1::ApiController < ApplicationController
    before_action :set_default_format

    private

    def set_default_format
      request.format = :json
    end
  end
end
