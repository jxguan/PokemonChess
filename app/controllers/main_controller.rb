class MainController < ApplicationController
  def home
    require_login
  end

  def welcome
    @no_navigation_bar = true
  end
end
