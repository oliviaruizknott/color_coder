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

  def new
    @review = Review.new
  end

  def index
    @reviews = Review.find(params[:color_id])
  end

  def edit
    @review = Review.find(params[:id])
    @review_ratings = Review::RATINGS
  end

  def update
    @review = Review.find(params[:id])
    @review_ratings = Review::RATINGS
    if @review.update(review_params)
      flash[:success] = "Your review is successfully saved!"
      redirect_to color_path(@review.color)
    else
      flash[:errors] = @review.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @color = Review.find(params[:id]).color
    Review.find(params[:id]).destroy
    redirect_to color_path(@color)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
