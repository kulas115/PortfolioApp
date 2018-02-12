require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe "#home" do
    it "responds successfully" do
      get :home
      expect(response).to be_success
    end

    it "returns a 200 response" do
      get :home
      expect(response).to have_http_status "200"
    end
  end

end
