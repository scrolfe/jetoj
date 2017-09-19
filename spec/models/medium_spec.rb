require 'rails_helper'

RSpec.describe Medium, type: :model do
  before :each do
    @user = FactoryGirl.create(:user)
  end

  it "is valid with a user, medium_type, and one medium" do
    medium = Medium.new(
      user: @user,
      medium_type: "video",
      youtube_id: "Zp_NxCyagaw"
    )
    expect(medium).to be_valid
  end

  it "is invalid without a user" do
    medium = Medium.new(
      user: nil,
      medium_type: "video",
      youtube_id: "Zp_NxCyagaw"
    )
    expect(medium).to_not be_valid
  end

  it "is invalid without a medium_type" do
    medium = Medium.new(
      user: @user,
      medium_type: nil,
      youtube_id: "Zp_NxCyagaw"
    )
    expect(medium).to_not be_valid
  end

  it "is invalid without any media" do
    medium = Medium.new(
      user: @user,
      medium_type: "video",
    )
    expect(medium).to_not be_valid
  end

  context "when creating a medium of type 'photo'" do
    it "is valid with an image file"
    it "is invalid with an audio file"
    it "is invalid with a video file"
  end

  context "when creating a medium of type 'video'" do
    it "is valid with a video file"
    it "is invalid with an image file"
    it "is invalid with an audio file"
  end

  context "when creating a medium of type 'audio'" do
    it "is valid with an audio file"
    it "is invalid with an image file"
    it "is invalid with a video file"
  end

end
