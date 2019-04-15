class ApplicationController < ActionController::Base
  layout -> { request.xhr? ? false : 'application' }
end
