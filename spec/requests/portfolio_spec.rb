require 'rails_helper'

RSpec.describe "Portfolios", type: :request do
  context "as an admin user" do
    before do
      @admin = FactoryBot.create(:admin)
    end

    context "with valid attributes" do
      it "add a portfolio" do
        portfolio_params = FactoryBot.attributes_for(:portfolio)
        sign_in @admin
        expect {
          post portfolios_path, params: { portfolio: portfolio_params }
        }.to change(Portfolio, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "does not add a portfolio" do
        portfolio_params = FactoryBot.attributes_for(:portfolio, :invalid)
        sign_in @admin
        expect {
          post portfolios_path, params: { portfolio: portfolio_params }
        }.to_not change(Portfolio, :count)
      end
    end
  end
end
