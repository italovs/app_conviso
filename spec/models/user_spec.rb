require 'rails_helper'
RSpec.describe User, type: :model do
  it 'is valid if username is not a email' do
    user = build(:user)
    expect(user).to be_valid
  end
  it 'username is uniq' do
    first_user = create(:user)
    expect do
      create(:user, username: first_user.username)
    end.to raise_error
  end
  it 'is invalid if username have email format' do
    user = build(:user, username: FFaker::Internet.email)
    expect(user).to_not be_valid
  end
end
