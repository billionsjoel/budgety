class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    categories = Category.includes(:purchases).all
    @categories = categories.map do |category|
      category.total = category.purchases.where(author: current_user).sum(:amount)
      category
    end
  end
end
