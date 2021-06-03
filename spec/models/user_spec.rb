require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'attributes' do
    it 'is valid if username is not a email' do
      user = build(:user)
      expect(user).to be_valid
    end
    it 'username is uniq' do
      first_user = create(:user)
      expect do
        create(:user, username: first_user.username)
      end.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Username has already been taken')
    end
    it 'is invalid if username have email format' do
      user = build(:user, username: FFaker::Internet.email)
      expect(user).to_not be_valid
    end
  end

  describe 'login' do
    before(:each) do
      @user = create(:user, password: '123456')
    end
    it 'with username' do
      logged_user = User.find_for_database_authentication({ login: @user.username })
      expect(logged_user).to eq(@user)
    end
    it 'with email' do
      logged_user = User.find_for_database_authentication({ login: @user.email })
      expect(logged_user).to eq(@user)
    end
  end
end
