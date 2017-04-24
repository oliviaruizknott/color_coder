class ColorsController < ApplicationController
  def index
    @colors = Color.all
    @recent_reviews = []
    Review.order('created_at DESC').limit(5).each do |r|
      @recent_reviews << r.color
    end
  end

  def show
    @color = Color.find(params[:id])
    @review = Review.new
    @review_ratings = Review::RATINGS
  end

  def new
    @color = Color.new
  end

  def create
    @color = Color.new(color_params_create)
    @color.user = current_user

    if @color.save
      flash[:success] = "Color added successfully"
      redirect_to color_path(@color)
    else
      flash[:errors] = @color.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @color = Color.find(params[:id])
  end

  def update
    @color = Color.find(params[:id])
    @color.user = current_user
    if @color.update(color_params_update)
      flash[:success] = "Color updated successfully"
      redirect_to color_path(@color)
    else
      flash[:errors] = @color.errors.full_messages.to_sentence
      render :new
    end
  end

  def data
    @colors = Color.all
    render json: @colors
  end

  private

  def color_params_create
    params.require(:color).permit(:hex_code, :nickname)
  end

  def color_params_update
    params.require(:color).permit(:nickname)
  end
end
