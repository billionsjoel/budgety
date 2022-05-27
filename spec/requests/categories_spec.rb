require 'rails_helper'

RSpec.describe "Categories", type: :request do
  let(:test_user) { create :user }
  before { sign_in test_user }
  let(:valid_category) { build :category, user: test_user }
  let(:invalid_category) { build :category, name: nil }
  let(:valid_attributes) { valid_category.attributes }

  let(:invalid_attributes) { invalid_category.attributes }

  describe "GET /categories" do
    it "works! (now write some real specs)" do
      get categories_index_path
      expect(response).to have_http_status(200)
    end
  end
end
