require 'rails_helper'

RSpec.describe Skill, type: :model do
  before do
    @skill = FactoryBot.build(:skill)
  end

  it "is valid with title and percent utilized" do
    expect(@skill).to be_valid
  end

  it "is invalid without title" do
    @skill.title = nil
    expect(@skill).to_not be_valid
  end

  it "is invalid without percent utilized" do
    @skill.percent_utilized = nil
    expect(@skill).to_not be_valid
  end
end
