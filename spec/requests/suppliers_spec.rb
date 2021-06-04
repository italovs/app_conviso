require 'rails_helper'
RSpec.describe 'Suppliers', type: :request do
  before(:each) do
    @user = create(:user)
    sign_in @user
    @supplier = create(:supplier, user_id: @user.id)
  end

  describe 'GET /index' do
    context 'when user is not logged' do
      it 'redirect to login page' do
        sign_out @user
        get suppliers_path
        expect(response).to redirect_to(user_session_path)
      end
    end
  end

  describe 'GET /suppliers/show/:id' do
    it 'return the data of supplier' do
      get "/suppliers/show/#{@supplier.id}"
      expect(response.body).to eq(@supplier.to_json)
    end
  end

  describe 'POST /suppliers/update' do
    context 'when user is not the owner' do
      it 'return unauthorized' do
        user = create(:user)
        second_supplier = create(:supplier, user_id: user.id)
        put supplier_update_path(second_supplier), params: { supplier: {
          id: second_supplier.id,
          name: FFaker::Company.name,
          email: FFaker::Internet.email
        } }
        expect(response.status).to eq(401)
      end
    end

    context 'when user is the owner' do
      it 'return ok and the new supplier datas' do
        name = FFaker::Company.name
        put supplier_update_path(@supplier), params: { supplier: { name: name } }
        expect(response.body[name]).to eq(name)
      end
    end
  end
  describe 'POST /suppliers', :without_supplier do
    it 'redirect to root when supplier is created' do
      post supplier_create_path, params: { supplier:
                                            { name: FFaker::Company.name,
                                              email: FFaker::Internet.email,
                                              phone: FFaker::PhoneNumber.phone_number,
                                              category: FFaker::Product.product } }
      expect(response).to redirect_to(root_path)
    end
    it 'redirect if user is not logged' do
      sign_out @user
      post supplier_create_path, params: { supplier:
                                            { name: FFaker::Company.name,
                                              email: FFaker::Internet.email,
                                              phone: FFaker::PhoneNumber.phone_number,
                                              category: FFaker::Product.product } }
      expect(response).to redirect_to(user_session_path)
    end
  end

  describe 'DELETE /suppliers/delete/:id' do
    it 'return 204' do
      delete supplier_delete_path(@supplier)
      expect(response.status).to eq(204)
    end
  end
end
