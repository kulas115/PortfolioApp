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

  describe "#create" do
    context "as an authenticated user" do
      before do
        @admin = FactoryBot.create(:admin)
      end

      context "with valid attributes" do
        it "add a portfolio" do
          portfolio_params = FactoryBot.attributes_for(:portfolio)
          sign_in @admin
          expect {
            post :create, params: { portfolio: portfolio_params }
          }.to change(Portfolio, :count).by(1)
        end
      end

      context "with invalid attributes" do
        it "does not add a portfolio" do
          portfolio_params = FactoryBot.attributes_for(:portfolio, :invalid)
          sign_in @admin
          expect {
            post :create, params: { portfolio: portfolio_params }
          }.to_not change(Portfolio, :count)
        end
      end
    end

    context "as a guest user" do
      it "returns a 302 response" do
        portfolio_params = FactoryBot.attributes_for(:portfolio)
        post :create, params: { portfolio: portfolio_params }
        expect(response).to have_http_status "302"
      end
      it "redirects to root page" do
        portfolio_params = FactoryBot.attributes_for(:portfolio)
        post :create, params: { portfolio: portfolio_params }
        expect(response).to redirect_to "/"
      end
    end
  end

  describe "#update" do
    context "as an authorized admin user" do
      before do
        @admin     = FactoryBot.create(:admin)
        @portfolio = FactoryBot.create(:portfolio)
      end

      it "updates a portfolio" do
        portfolio_params = FactoryBot.attributes_for(:portfolio, title: "New Portfolio Name")
        sign_in @admin
        expect(:patch => "/portfolios/#{@portfolio.id}").to be_routable
        patch :update, params: { id: @portfolio.id, portfolio: portfolio_params }
        expect(@portfolio.reload.title).to eq "New Portfolio Name"
      end
    end

    context "as a non admin user" do
      before do
        @user      = FactoryBot.create(:user)
        @portfolio = FactoryBot.create(:portfolio)
      end

      it "returns a 302 response" do
        portfolio_params = FactoryBot.attributes_for(:portfolio)
        sign_in @user
        patch :update, params: { id: @portfolio.id, portfolio: portfolio_params }
        expect(response).to have_http_status "302"
      end

      it "redirects to home page" do
        portfolio_params = FactoryBot.attributes_for(:portfolio)
        sign_in @user
        patch :update, params: { id: @portfolio.id, portfolio: portfolio_params }
        expect(response).to redirect_to "/"
      end
    end

    context "as a guest user" do
      before do
        @portfolio = FactoryBot.create(:portfolio)
      end

      it "returns a 302 response" do
        portfolio_params = FactoryBot.attributes_for(:portfolio)
        patch :update, params: { id: @portfolio.id, portfolio: portfolio_params }
        expect(response).to have_http_status "302"
      end

      it "redirects to home page" do
        portfolio_params = FactoryBot.attributes_for(:portfolio)
        patch :update, params: { id: @portfolio.id, portfolio: portfolio_params }
        expect(response).to redirect_to "/"
      end
    end
  end

  describe "#destroy" do
    context "as an authorized admin user" do
      before do
        @admin     = FactoryBot.create(:admin)
        @portfolio = FactoryBot.create(:portfolio)
      end

      it "deletes a portfolio" do
        sign_in @admin
        expect {
          delete :destroy, params: { id: @portfolio.id }
        }.to change(Portfolio, :count).by(-1)
      end
    end
    context "as an non admin user" do
      before do
        @user      = FactoryBot.create(:user)
        @portfolio = FactoryBot.create(:portfolio)
      end

      it "does not delete project" do
        sign_in @user
        expect {
          delete :destroy, params: { id: @portfolio.id }
        }.to_not change(Portfolio, :count)
      end

      it "redirects to homepage" do
        sign_in @user
        delete :destroy, params: { id: @portfolio.id }
        expect(response).to redirect_to root_path
      end
    end

    context "as a guest user" do
      before do
        @portfolio = FactoryBot.create(:portfolio)
      end
      it "does not delete project" do
        expect {
          delete :destroy, params: { id: @portfolio.id }
        }.to_not change(Portfolio, :count)
      end

      it "redirects to homepage" do
        delete :destroy, params: { id: @portfolio.id }
        expect(response).to redirect_to root_path
      end
    end
  end
end
