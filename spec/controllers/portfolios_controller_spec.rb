require 'rails_helper'

RSpec.describe PortfoliosController, type: :controller do
  describe "#new" do
    context "as an authenticated user" do
      before do
        @admin = FactoryBot.create(:admin)
      end

      it "responds successfully" do
        sign_in @admin
        get     :new
        expect(response).to be_success
      end

      it "returns a 200 response" do
        sign_in @admin
        get     :index
        expect(response).to be_success
      end
    end

    context "as a guest user" do
      it "returns a 302 response" do
        get :new
        expect(response).to have_http_status "302"
      end
    end
  end
end
