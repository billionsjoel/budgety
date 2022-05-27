class Category < ApplicationRecord
  attr_accessor :total

  belongs_to :user
  has_many :purchases
end
