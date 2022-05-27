require 'rails_helper'

RSpec.describe 'categories/new', type: :system do
  let(:test_user) { create :user }

  before do
    driven_by(:rack_test)
    sign_in test_user
    visit new_category_url
  end

  it 'renders the New category title' do
    expect(page).to have_content('New Category')
  end

  it 'Should lead back to categories page' do
    page.find('#back_to_home').click
    expect(current_path).to eql(categories_path)
  end
end