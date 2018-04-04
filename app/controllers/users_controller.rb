class UsersController < ApplicationController
  def show
    @reviews = current_user.reviews.includes(:product)
  end
end
