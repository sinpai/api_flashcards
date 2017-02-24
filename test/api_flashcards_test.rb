require 'test_helper'
require 'support/auth_helper'

class ApiFlashcards::Test < ActiveSupport::TestCase
  include AuthHelper
  setup do
    http_login
  end

  test 'Check basic auth' do
    get :root
    assert_response :success
  end
end
