require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { FactoryBot.create(:comment) }

  it { is_expected.to validate_presence_of :content }
  it { is_expected.to validate_length_of(:content).is_at_least(5) }
  it { is_expected.to validate_length_of(:content).is_at_most(1000) }

end
