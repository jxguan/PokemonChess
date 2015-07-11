class UsersController < ApplicationController
  def new
    @no_navigation_bar = true
    @user = User.new
  end

  def create
    @no_navigation_bar = true
    if (params[:user] != nil)
      if (params[:user][:invitation] != "8245")
        flash[:notice] = "Invalid Invitation Code"
        redirect_to("/users/new")
      else

        @user = User.new(user_params(params[:user]))
        if @user.save
          redirect_to(:controller => "users", :action => "login")
        else
          render(:action => "new")
        end
      end
    else
      @user = User.new
      render(:action => "new")
    end
  end

  def login
    @no_navigation_bar = true
  end

  def post_login
    @no_navigation_bar = true
    user = User.find_by login: params[:username]
    if (user == nil)
      flash[:notice] = "Login Name does not exist!"
      redirect_to("/users/login")
    elsif (!user.password_valid?(params[:password]))
      flash[:notice] = "Invalid Login and Password Combination!"
      redirect_to("/users/login")
    else
      session[:user_id] = user.id
      redirect_to(controller: "main", action: "index")
    end
  end

  def logout
    reset_session
    redirect_to(controller: "users", action: "login")
  end

  private
  def user_params(params)
    return params.permit(:username, :login, :password, :password_confirmation)
  end
end
