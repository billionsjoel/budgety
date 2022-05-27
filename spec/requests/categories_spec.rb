require 'rails_helper'

RSpec.describe "Categories", type: :request do
  let(:test_user) { create :user }
  before { sign_in test_user }
  let(:valid_category) { build :category, user: test_user }
  let(:invalid_category) { build :category, name: nil }
  let(:valid_attributes) { valid_category.attributes }

  let(:invalid_attributes) { invalid_category.attributes }

  describe "GET /index" do
    it 'renders a successful response' do
      get categories_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      valid_category.save
      get category_url(valid_category)
      expect(response).to be_successful
    end
  end
end
