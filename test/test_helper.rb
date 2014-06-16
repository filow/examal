ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all


  # Add more helper methods to be used by all tests here...
  def login
  	teacher=Teacher.first
    session[:teacher_id]=teacher.id
  end
  def login_as(user)
    teacher=teachers(user)
    session[:teacher_id]=teacher.id
  end
  def logout
  	session.delete :teacher_id
  end
end
