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
#
def upvote
  @review = Review.find(params[:id])
  @user = current_user
  @vote = Vote.find_by(user_id: @user.id, review_id: @review.id)
  if @vote.nil?
    @vote = Vote.create(user_id: @user.id, review_id: @review.id, vote_value: true)
  elsif @vote.vote_value == true
    @vote.destroy
  else
    @vote.update(vote_value: true)
  end

  respond_to do |format|
    format.html
    format.json { render json: { review: @review, vote: @review.tally } }
  end
end

def downvote
  @review = Review.find(params[:id])
  @user = current_user
  @vote = Vote.find_by(user_id: @user.id, review_id: @review.id)

  if @vote.nil?
    @vote = Vote.create(user_id: @user.id, review_id: @review.id, vote_value: false)
  elsif @vote.vote_value == false
    @vote.destroy
  else
    @vote.update(vote_value: false)
  end

  respond_to do |format|
    format.html
    format.json { render json: { review: @review, vote: @review.tally } }
  end

end

  def destroy
    @color = Review.find(params[:id]).color
    Review.find(params[:id]).destroy
    redirect_to color_path(@color)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body, :votes_total)
  end
end
