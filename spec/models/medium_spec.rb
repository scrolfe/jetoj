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
    medium.valid?
    expect(medium.errors[:user]).to include("must exist")
  end

  it "is invalid without a medium_type" do
    medium = Medium.new(
      user: @user,
      medium_type: nil,
      youtube_id: "Zp_NxCyagaw"
    )
    medium.valid?
    expect(medium.errors[:medium_type]).to include("can't be blank")
  end

  context "when creating a medium of type 'photo'" do
    it "is valid with an image file" do
      medium = Medium.new(
        user: @user,
        medium_type: "photo",
        youtube_id: nil,
        image: File.new("#{Rails.root}/spec/fixtures/paperclip/test.jpg"),
        audio: nil
      )
      expect(medium).to be_valid
    end

    it "is invalid with an audio file" do
      medium = Medium.new(
        user: @user,
        medium_type: "photo",
        youtube_id: nil,
        image: nil,
        audio: File.new("#{Rails.root}/spec/fixtures/paperclip/audio.mp3")
      )
      medium.valid?
      expect(medium.errors[:audio_file_name]).to include("must be blank")
    end

    it "is invalid with a video url" do
      medium = Medium.new(
        user: @user,
        medium_type: "photo",
        youtube_id: "Zp_NxCyagaw",
        image: nil,
        audio: nil
      )
      medium.valid?
      expect(medium.errors[:youtube_id]).to include("must be blank")
    end
  end

  context "when creating a medium of type 'video'" do
    it "is valid with a video url" do
      medium = Medium.new(
        user: @user,
        medium_type: "video",
        youtube_id: "Zp_NxCyagaw",
        image: nil,
        audio: nil
      )
      expect(medium).to be_valid
    end

    it "is invalid with an image file" do
      medium = Medium.new(
        user: @user,
        medium_type: "video",
        youtube_id: nil,
        image: File.new("#{Rails.root}/spec/fixtures/paperclip/test.jpg"),
        audio: nil
      )
      medium.valid?
      expect(medium.errors[:image_file_name]).to include("must be blank")
    end

    it "is invalid with an audio file" do
      medium = Medium.new(
        user: @user,
        medium_type: "video",
        youtube_id: nil,
        image: nil,
        audio: File.new("#{Rails.root}/spec/fixtures/paperclip/audio.mp3")
      )
      medium.valid?
      expect(medium.errors[:audio_file_name]).to include("must be blank")
    end
  end

  context "when creating a medium of type 'audio'" do
    it "is valid with an audio file" do
      medium = Medium.new(
        user: @user,
        medium_type: "audio",
        youtube_id: nil,
        image: nil,
        audio: File.new("#{Rails.root}/spec/fixtures/paperclip/audio.mp3")
      )
      expect(medium).to be_valid
    end

    it "is invalid with an image file" do
      medium = Medium.new(
        user: @user,
        medium_type: "audio",
        youtube_id: nil,
        image: File.new("#{Rails.root}/spec/fixtures/paperclip/test.jpg"),
        audio: nil
      )
      medium.valid?
      expect(medium.errors[:image_file_name]).to include("must be blank")
    end

    it "is invalid with a video url" do
      medium = Medium.new(
        user: @user,
        medium_type: "audio",
        youtube_id: "Zp_NxCyagaw",
        image: nil,
        audio: nil
      )
      medium.valid?
      expect(medium.errors[:youtube_id]).to include("must be blank")
    end
  end
end
