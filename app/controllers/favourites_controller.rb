class FavouritesController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @favourite = Favourite.new(user_id: current_user.id, article_id: @article.id)
    @favourite.save!
  end

  def destroy
    @user = current_user
    @article = Article.find(params[:article_id])
    @favourite = Favourite.find_by(user_id: @user.id, article_id: @article.id)
    @favourite.delete
    #@favourite = Favourite.where(user_id: @user.id, article_id: @article.id)
    #@favourite[0].delete
  end

end
