require 'rails_helper'

RSpec.describe "Purchases", type: :request do
  let(:test_user) { create :user }
  let(:test_category) { create :category }
  before { sign_in test_user }
  let(:valid_purchase) { build :purchase, author: test_user, category: test_category }
  let(:invalid_purchase) { build :purchase, name: nil, author: test_user, category: test_category }
  let(:valid_attributes) { valid_purchase.attributes }

  let(:invalid_attributes) { invalid_purchase.attributes }
  describe "GET /purchases" do

  end
end
