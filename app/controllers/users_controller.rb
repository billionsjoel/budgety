class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    categories = Category.includes(:purchases).all
    @categories = categories.map do |category|
      category.total = category.purchases.where(author: current_user).sum(:amount)
      category
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_url, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end
end
