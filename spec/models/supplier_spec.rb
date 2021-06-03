require 'rails_helper'

RSpec.describe Supplier, type: :model do
  before(:each) do
    user = create(:user)
  end
  
  it 'only one supplier with these email per user' do
    first_supplier = create(:supplier, email: user.email)
    second_supplier = builde(:supplier, email: user.email)
    expect(second_supplier).to_not be_valid
  end
end
