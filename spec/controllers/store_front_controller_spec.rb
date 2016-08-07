require 'rails_helper'

RSpec.describe StoreFrontController, type: :controller do

  describe "GET #index" do
    let(:product_list){FactoryGirl.create_list(:product, 10, promoted: true)}
    let(:non_promoted_products){FactoryGirl.create_list(:product, 2, promoted: false)}

    it "returns http success" do
      get :index

      expect(response).to have_http_status(:success)
    end

    it "returns only promoted products" do
      get :index

      expect(assigns(:products)).to eq(product_list)
    end
  end

  describe "GET #show" do
    let(:product){FactoryGirl.create(:product)}

    it "returns http success" do
      get :show, id: product

      expect(response).to have_http_status(:success)
    end

    it "diplays only the requested product" do
      get :show, id: product

      expect(assigns(:product)).to eql(product)
    end
  end

end
