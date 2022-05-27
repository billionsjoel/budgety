require 'rails_helper'

RSpec.describe 'categories/new', type: :system do
  let(:test_user) { create :user }

  before do
    driven_by(:rack_test)
    sign_in test_user
    visit new_category_url
  end

end