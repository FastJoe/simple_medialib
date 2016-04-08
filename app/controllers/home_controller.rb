class HomeController < ApplicationController

  def index
    if current_user.present?
      user_home
    else
      guest_home
    end
  end

  def guest_home
    render :guest_home
  end

  def user_home
    render :user_home
  end
end
