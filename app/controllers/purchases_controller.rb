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

  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to purchase_url(@purchase), notice: 'Purchase was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_users_categories
    @users = User.pluck(:name, :id)
    @categories = Category.pluck(:name, :id)
  end

  def destroy
    @purchase.destroy

    respond_to do |format|
      format.html { redirect_to purchases_url, notice: 'Purchase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  def purchase_params
    params.require(:purchase).permit(:name, :amount, :category_id, :author_id)
  end
end
