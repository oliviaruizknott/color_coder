class CurrentUserController < ApplicationController
  def data
    @user = current_user
    render json: @user
  end
end
