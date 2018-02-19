require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { FactoryBot.build(:user) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  it { is_expected.to validate_presence_of :password }
  it { is_expected.to satisfy { |user| user.first_name == "Norville" } }
  it { is_expected.to satisfy { |user| user.last_name == "Rogers" } }

  it "is invalid with password shorter than 6 chars" do
    user.password = "foo"
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
  end

  it "is invalid with password longer than 20 chars" do
    user.password = "foobarfoobarfoobarfoobar"
    user.valid?
    expect(user.errors[:password]).to include("is too long (maximum is 20 characters)")
  end

  ### Alternative/conservative approach

  # before do
  #   @user = FactoryBot.build(:user)
  # end
  # it "has a valid factory" do
  #   expect(@user).to be_valid
  # end
  #
  # it "is invalid without a name" do
  #   @user.name = nil
  #   @user.valid?
  #   expect(@user.errors[:name]).to include("can't be blank")
  # end
  #
  # it "is invalid without an email address" do
  #   @user.email = nil
  #   @user.valid?
  #   expect(@user.errors[:email]).to include("can't be blank")
  # end
  #
  # it "is invalid with a duplicated email address" do
  #   user            = FactoryBot.create(:user, email: "norville@example.com")
  #   user_duplicated = FactoryBot.build(:user, email: "norville@example.com")
  #   user_duplicated.valid?
  #   expect(user_duplicated.errors[:email]).to include("has already been taken")
  # end
  #
  # it "is invalid with password shorter than 6 chars" do
  #   @user.password = "foo"
  #   @user.valid?
  #   expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)")
  # end
  #
  # it "is invalid with password longer than 20 chars" do
  #   @user.password = "foobarfoobarfoobarfoobar"
  #   @user.valid?
  #   expect(@user.errors[:password]).to include("is too long (maximum is 20 characters)")
  # end
  #
  # it "returns a user's first name as a string" do
  #   expect(@user.first_name).to eq "Norville"
  # end
  #
  # it "returns a user's last name as a string" do
  #   expect(@user.last_name).to eq "Rogers"
  # end
end
