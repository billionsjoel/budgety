class RemoveTotalFromCategories < ActiveRecord::Migration[7.0]
  def change
    remove_column :categories,:total
  end
end
