require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) {
    described_class.new name:               name,
                        email:              email,
                        password:           password
  }

  let(:name)               { 'Kamil' }
  let(:email)              { 'test@test.com' }
  let(:password)           { 'foobar' }

  it { is_expected.to be_valid }

  context 'with a  password that is less than 6 chars long' do
    let(:password) { 'foo'}

    it { is_expected.to be_invalid }
  end

  context 'with a  password that is more than 20 chars long' do
    let(:password) { 'foobarfoobarfoobarfoobar'}

    it { is_expected.to be_invalid }
  end
end
