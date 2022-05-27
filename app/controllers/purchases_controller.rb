class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.where(author: current_user, category_id: params[:category_id]).order(updated_at: :desc)
    @total = @purchases.sum(:amount)
  end

  def new
    @purchase = Purchase.new
    set_users_categories
  end
end
