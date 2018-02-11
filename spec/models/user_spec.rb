require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(
      name:       "Norville Rogers",
      email:      "norville@example.com",
      password:   "foobar",
    )
  end
  it "has a valid factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "is invalid without a name" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "is invalid without an email address" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid with a duplicated email address" do
    user            = FactoryBot.create(:user, email: "norville@example.com")
    user_duplicated = FactoryBot.build(:user, email: "norville@example.com")
    user_duplicated.valid?
    expect(user_duplicated.errors[:email]).to include("has already been taken")
  end

  it "is invalid with password shorter than 6 chars" do
    @user.password = "foo"
    @user.valid?
    expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)")
  end

  it "is invalid with password longer than 20 chars" do
    @user.password = "foobarfoobarfoobarfoobar"
    @user.valid?
    expect(@user.errors[:password]).to include("is too long (maximum is 20 characters)")
  end

  it "returns a user's first name as a string" do
    user = FactoryBot.build(:user, name: "Norville Rogers")
    expect(user.first_name).to eq "Norville"
  end

  it "returns a user's last name as a string" do
    user = FactoryBot.build(:user, name: "Norville Rogers")
    expect(user.last_name).to eq "Rogers"
  end


  # subject(:user) {
  #   described_class.new name:               name,
  #                       email:              email,
  #                       password:           password
  # }
  #
  # let(:name)               { 'Kamil' }
  # let(:email)              { 'test@test.com' }
  # let(:password)           { 'foobar' }
  #
  # it { is_expected.to be_valid }
  #
  # context 'with a  password that is less than 6 chars long' do
  #   let(:password) { 'foo'}
  #
  #   it { is_expected.to be_invalid }
  # end
  #
  # context 'with a  password that is more than 20 chars long' do
  #   let(:password) { 'foobarfoobarfoobarfoobar'}
  #
  #   it { is_expected.to be_invalid }
  # end
end
