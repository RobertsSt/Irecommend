ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  def self.default_password
    'password123'
  end
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  #include Warden::Test::Helpers

  def sign_in_as(name)
    user = users(name)
    post user_session_url, params: { user: { email: user.email, password: self.class.default_password } }
  end
end
