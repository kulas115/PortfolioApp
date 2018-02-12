require 'rails_helper'

RSpec.describe Portfolio, type: :model do
  before do
    @portfolio = FactoryBot.build(:portfolio)
  end

  it "is valid with title and body" do
    expect(@portfolio).to be_valid
  end

  it 'is invalid without title' do
    @portfolio.title = nil
    @portfolio.valid?
    expect(@portfolio.errors[:title]).to include("can't be blank")
  end

  it 'is invalid without body' do
    @portfolio.body = nil
    @portfolio.valid?
    expect(@portfolio.errors[:body]).to include("can't be blank")
  end

  it "returns portoflio items with subtitle 'Ruby on Rails'" do
    portfolio1 = FactoryBot.create(:portfolio, subtitle: "Ruby on Rails")
    portfolio2 = FactoryBot.create(:portfolio, subtitle: "Ruby on Rails")
    portfolio3 = FactoryBot.create(:portfolio, subtitle: "Angular")

    expect(Portfolio.ruby_on_rails_portfolio_items).to     include(portfolio1, portfolio2)
    expect(Portfolio.ruby_on_rails_portfolio_items).to_not include(portfolio3)
  end

  it "returns empty collection when no item got subtitle 'Ruby on Rails'" do
    portfolio1 = FactoryBot.create(:portfolio, subtitle: "")
    portfolio2 = FactoryBot.create(:portfolio, subtitle: "")
    portfolio3 = FactoryBot.create(:portfolio, subtitle: "")

    expect(Portfolio.ruby_on_rails_portfolio_items).to be_empty
  end
end
