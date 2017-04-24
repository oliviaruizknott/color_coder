class ReviewsController < ApplicationController
  def create
    @color = Color.find(params[:color_id])
    @review = Review.new(review_params)
    @review.color = @color
    @review.user = current_user
    if @review.save
      flash[:success] = "Your review is successfully saved!"
      redirect_to color_path(@color)
    else
      flash[:alert] = ''
      @review.errors.full_messages.each do |m|
        flash[:alert] += m
      end
      redirect_to color_path(@color)
    end
  end

  def data
    @reviews = Review.all
    render json: @reviews
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
