class ColorsController < ApplicationController

  def index
    @colors = Color.all
  end

end
