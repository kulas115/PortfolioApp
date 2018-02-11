require 'rails_helper'

RSpec.describe Blog, type: :model do
  before do
    @topic = Topic.create(
      title:    "Rails",
    )
    @blog = Blog.new(
      title:    "New Blog",
      body:     "Blog body",
      topic_id:  @topic.id,
    )
  end

  it "is valid with a title, body and associated topic" do
    expect(@blog).to be_valid
  end

  it "is invalid without a title" do
    @blog.title = nil
    @blog.valid?
    expect(@blog.errors[:title]).to include("can't be blank")
  end

  it "is invalid without an body" do
    @blog.body = nil
    @blog.valid?
    expect(@blog.errors[:body]).to include("can't be blank")
  end

  describe "Blog method" do
    before do
      @topic = Topic.create(
        title:    "Rails",
      )
      @blog1 = Blog.create(
        title:    "New Blog 1",
        body:     "Blog body",
        topic_id: @topic.id,
      )
      @blog2 = Blog.create(
        title:    "New Blog 2",
        body:     "Blog body",
        topic_id: @topic.id,
      )
      @blog3 = Blog.create(
        title:    "New Blog 3",
        body:     "Blog body",
        topic_id: @topic.id,
      )
    end

    context "with .special blog" do
      it "returns all blogs" do
        expect(Blog.special_blogs).to include(@blog1, @blog2, @blog3)
      end
    end

    context "with .featured_blogs" do
      it "returns 2 blogs" do
        expect(Blog.featured_blogs).to include(@blog1, @blog2)
      end
    end

    context "with .recent" do
      it "returns blogs sorded by descending order" do
        expected_order = [@blog3, @blog2, @blog1]
        expect(Blog.recent).to eq expected_order
      end
    end
  end
end
