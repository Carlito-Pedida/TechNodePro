class HomeController < ApplicationController
  def home
    if logged_in?
    redirect_to articles_path
  end
  def about
  end
end
