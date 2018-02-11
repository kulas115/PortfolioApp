require 'rails_helper'

RSpec.describe Portfolio, type: :model do
  it "is valid with title and body" do
    portfolio = Portfolio.new(
      title: "Test",
      body:  "Test",
    )
    expect(portfolio).to be_valid
  end

  it 'is invalid without title' do
    portfolio = Portfolio.new(
      title: nil,
      body:  "Test",
    )
    portfolio.valid?
    expect(portfolio.errors[:title]).to include("can't be blank")
  end

  it 'is invalid without body' do
    portfolio = Portfolio.new(
      title: "Test",
      body:   nil,
    )
    portfolio.valid?
    expect(portfolio.errors[:body]).to include("can't be blank")
  end

  it "returns portoflio items with subtitle 'Ruby on Rails'" do
      portfolio1 = Portfolio.create(
      title: "Test porfolio1",
      subtitle: "Ruby on Rails",
      body:     "Test",
    )

    portfolio2 = Portfolio.create(
      title: "Test porfolio2",
      subtitle: "Ruby on Rails",
      body:     "Test",
    )

    portfolio3 = Portfolio.create(
      title: "Test porfolio3",
      subtitle: "Angular",
      body:     "Test",
    )

    expect(Portfolio.ruby_on_rails_portfolio_items).to include(portfolio1, portfolio2)
    expect(Portfolio.ruby_on_rails_portfolio_items).to_not include(portfolio3)
  end

  it "returns empty collection when no item got subtitle 'Ruby on Rails'" do
      portfolio1 = Portfolio.create(
      title: "Test porfolio1",
      subtitle: "Java",
      body:     "Test",
    )

    portfolio2 = Portfolio.create(
      title: "Test porfolio2",
      subtitle: "CSS",
      body:     "Test",
    )

    portfolio3 = Portfolio.create(
      title: "Test porfolio3",
      subtitle: "Angular",
      body:     "Test",
    )

    expect(Portfolio.ruby_on_rails_portfolio_items).to be_empty
  end
end
