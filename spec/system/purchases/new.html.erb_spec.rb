require 'rails_helper'

RSpec.describe 'purchases/new', type: :system do
  let(:test_user) { create :user }
  let(:test_category) { create :category }

  before do
    driven_by(:rack_test)
    sign_in test_user
    visit new_category_purchase_url(test_category)
  end

  it 'should render New Purchase' do
    expect(page).to have_content('New Purchase')
  end

  it 'should redirect back' do
    page.find('#back_to_home').click
    expect(current_path).to eql(category_purchases_path(test_category))
  end
end
