RSpec.shared_context "portfolios controller setup" do
  let(:admin)     { FactoryBot.create(:admin) }
  let(:user)      { FactoryBot.create(:user) }
  let(:portfolio) { FactoryBot.create(:portfolio) }
end
