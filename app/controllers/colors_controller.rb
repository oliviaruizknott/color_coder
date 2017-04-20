class ColorsController < ApplicationController
  def index
    @colors = Color.all
  end

  def show
    @color = Color.find(params[:id])
  end

  def new
    @color = Color.new
  end

  def create
    @color = Color.new(color_params)
    @color.user = current_user

    if @color.save
      flash[:success] = "Color added successfully"
      redirect_to color_path(@color)
    else
      flash[:errors] = @color.errors.full_messages.to_sentence
      render :new
    end
  end


  private

  def color_params
    params.require(:color).permit(:hex_code, :nickname)
  end

end
