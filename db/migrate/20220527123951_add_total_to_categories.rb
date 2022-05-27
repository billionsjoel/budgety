class AddTotalToCategories < ActiveRecord::Migration[7.0]
  def self.up
    add_column :categories, :total, :integer, null: false, default: 0
  end

  def self.down
    remove_column :categories, :total
  end
end
