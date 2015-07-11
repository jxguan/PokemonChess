class MainController < ApplicationController
  def index
    require_login
  end
end
