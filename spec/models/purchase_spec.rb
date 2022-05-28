require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it { should belong_to :author }
  it { should belong_to :category }
  it { should validate_presence_of :name }
  it { should validate_presence_of :amount }
end
