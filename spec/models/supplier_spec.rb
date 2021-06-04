require 'rails_helper'

RSpec.describe Supplier, type: :model do
  before(:each) do
    @user = create(:user)
  end

  it 'only one supplier with same email per user' do
    email = FFaker::Internet.email
    first_supplier = create(:supplier, email: email, user_id: @user.id)
    second_supplier = build(:supplier, email: email, user_id: @user.id)
    expect(second_supplier).to_not be_valid
  end
end
