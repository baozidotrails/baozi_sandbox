class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # 全體的 Controller 都可以使用 SessionHelper 這個 Module
  include SessionsHelper
end
