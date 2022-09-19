class PagesController < ApplicationController

def profile
  @favourites = current_user.favourites




  @articles = current_user.articles
  end
end
