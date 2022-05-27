require 'rails_helper'

RSpec.describe 'categories/index', type: :system do
  let(:test_user) { create :user }

  before do
    driven_by(:rack_test)
    sign_in test_user
    visit categories_url
  end

  it 'renders the title' do
    expect(page).to have_content('categories')
  end


end