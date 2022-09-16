if @review.persisted?
  json.form render(partial: "reviews/form", formats: :html, locals: {article: @article, review: Review.new})
  json.inserted_item render(partial: "articles/review", formats: :html, locals: {review: @review})
else
  json.form render(partial: "reviews/form", formats: :html, locals: {article: @article, review: @review})
end
