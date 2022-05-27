class ChangeNameInPurchases < ActiveRecord::Migration[7.0]
  def change
    change_column :purchases,:name,:string, null:false
  end
end
