class Purchase < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  validates :amount, presence: true
  validates :name, presence: true
end
