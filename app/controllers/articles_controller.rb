class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      sql_query = "title ILIKE :query OR author ILIKE :query OR category ILIKE :query"
      @articles = Article.where(sql_query, query: "%#{params[:query]}%")
    else
      @articles = Article.all
    end
  end

  def show
    @review = Review.new
    @reviews = @article.reviews
    @user = current_user
  end

  def new
    @article = Article.new
  end

  def create

    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save!
      redirect_to article_path(@article.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  @article.update(article_params)
  redirect_to article_path(@article.id)
  end

  def destroy
    @article.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to root_path, status: :see_other
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :author, :url, :content, :category)
  end
end
