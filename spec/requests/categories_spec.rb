require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  let(:test_user) { create :user }
  before { sign_in test_user }
  let(:valid_category) { build :category, user: test_user }
  let(:invalid_category) { build :category, name: nil }
  let(:valid_attributes) { valid_category.attributes }

  let(:invalid_attributes) { invalid_category.attributes }

  describe 'GET /index' do
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

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_category_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      valid_category.save
      get edit_category_url(valid_category)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Category' do
        expect do
          post categories_url, params: { category: valid_attributes }
        end.to change(Category, :count).by(1)
      end

      it 'tests if redirects to categories after save' do
        post categories_url, params: { category: valid_attributes }
        expect(response).to redirect_to(categories_url)
      end
    end
  end

  context 'with invalid parameters' do
    it 'fails on creating a new Category' do
      expect do
        post categories_url, params: { category: invalid_attributes }
      end.to change(Category, :count).by(0)
    end

    it 'displays new template on success' do
      post categories_url, params: { category: invalid_attributes }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
