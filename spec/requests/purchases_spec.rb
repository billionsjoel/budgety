require 'rails_helper'

RSpec.describe "Purchases", type: :request do
  let(:test_user) { create :user }
  let(:test_category) { create :category }
  before { sign_in test_user }
  let(:valid_purchase) { build :purchase, author: test_user, category: test_category }
  let(:invalid_purchase) { build :purchase, name: nil, author: test_user, category: test_category }
  let(:valid_attributes) { valid_purchase.attributes }

  let(:invalid_attributes) { invalid_purchase.attributes }
  describe "GET /index" do
    it 'renders a successful response' do
      valid_purchase.save
      get category_purchases_url(test_category)
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      valid_purchase.save
      get category_purchase_url(category_id: test_category.id, id: valid_purchase.id)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_category_purchase_url(test_category)
      expect(response).to be_successful
    end
  end
end
