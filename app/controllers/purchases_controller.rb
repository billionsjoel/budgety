class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.where(author: current_user, category_id: params[:category_id]).order(updated_at: :desc)
    @total = @purchases.sum(:amount)
  end

  def new
    @purchase = Purchase.new
    set_users_categories
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.author = current_user
    respond_to do |format|
      if @purchase.save
        format.html do
          redirect_to category_purchases_url(category_id: @purchase.category_id),
                      notice: 'Purchase was successfully created.'
        end
        format.json { render :show, status: :created, location: @purchase }
      else
        set_users_categories
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end
end
