class ColorsController < ApplicationController
  def index
    @colors = Color.all
  end

  def show
    @color = Color.find(params[:id])
    @review = Review.new
    @review_ratings = Review::RATINGS
  end
end
