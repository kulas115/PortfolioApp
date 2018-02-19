require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:blog)  { FactoryBot.create(:blog) }
  let(:topic) { FactoryBot.create(:topic) }

  it "is valid with title" do
    expect(topic).to be_valid
  end

  it "is invalid without title" do
    topic.title = nil
    expect(topic).to_not be_valid
  end

  it "shows only topics with associated blogs" do
    blog.update(topic_id: topic.id)
    expect(Topic.with_blogs).to include(topic)
  end

  it "don't show topics without blogs associated" do
    expect(Topic.with_blogs).to_not include(topic)
  end
end
