class ReviewsController < ApplicationController
  # def create
  #   @article = Article.find(params[:article_id])
  #   @review = Review.new(review_params)
  #   @review.article = @article
  #   @review.user = current_user
  #   if @review.save!
  #     redirect_to article_path(@article)
  #   else
  #     render "articles/show", status: :unprocessable_entity
  #   end
  # end

  def create
    @article = Article.find(params[:article_id])
    @review = Review.new(review_params)
    @review.article = @article
    @review.user = current_user

    respond_to do |format|
      if @review.save
        format.html { redirect_to article_path(@article) }
        format.json # Follow the classic Rails flow and look for a create.json view
      else
        format.html { render "articles/show", status: :unprocessable_entity }
        format.json # Follow the classic Rails flow and look for a create.json view
      end
    end
  end

  def destroy
    # @article = Article.find(params[:article_id])

    @review = Review.find(@article, params[:id])
    @review.delete
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
