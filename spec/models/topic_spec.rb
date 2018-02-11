require 'rails_helper'

RSpec.describe Topic, type: :model do
  before do
    @topic               = Topic.create(
                                  title:    "Rails",
                                )
    @topic_without_blogs = Topic.create(
                                  title:    "angular",
                                )
    @blog                = Blog.create(
                                  title:    "New Blog",
                                  body:     "Blog body",
                                  topic_id:  @topic.id,
                                )
  end

  it "is valid with title" do
    expect(@topic).to be_valid
  end

  it "is invalid without title" do
    @topic.title = nil
    expect(@topic).to_not be_valid
  end

  it "shows only topics with associated blogs" do
    expect(Topic.with_blogs).to include(@topic)
  end

  it "don't show topics without blogs associated" do
    expect(Topic.with_blogs).to_not include(@topic_without_blogs)
  end
end
