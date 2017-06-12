class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def valid_info object
    render file: "public/404.html", layout: false unless object
  end
end
