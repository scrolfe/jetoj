require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @user = FactoryGirl.create(:user)
  end

  it "is valid with a title, body, and user" do
    post = FactoryGirl.build(:post, user: @user)
    post.valid?

    expect(post).to be_valid
  end

  it "is invalid without a title" do
    post = FactoryGirl.build(:post, user: @user, title: nil)
    post.valid?

    expect(post.errors[:title]).to include("can't be blank")
  end

  it "is invalid without a body" do
    post = FactoryGirl.build(:post, user: @user, body: nil)
    post.valid?

    expect(post.errors[:body]).to include("can't be blank")
  end

  it "is invalid without a user" do
    post = FactoryGirl.build(:post, user: nil)
    post.valid?

    expect(post.errors[:user]).to include("can't be blank")
  end
end
