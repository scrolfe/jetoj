require 'rails_helper'

RSpec.describe Event, type: :model do
  before :each do
    @user = FactoryGirl.create(:user)
  end

  it "is valid with a name, description, branch, address, date_time, user, and image" do
    event = FactoryGirl.build(:event, user: @user)

    expect(event).to be_valid
  end

  it "is invalid without a name" do
    event = FactoryGirl.build(:event, user: @user, name: nil)
    event.valid?

    expect(event.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a description" do
    event = FactoryGirl.build(:event, description: nil)
    event.valid?

    expect(event.errors[:description]).to include("can't be blank")
  end

  it "is invalid without a branch" do
    event = FactoryGirl.build(:event, user: @user, branch: nil)
    event.valid?

    expect(event.errors[:branch]).to include("can't be blank")
  end

  it "is invalid without an address" do
    event = FactoryGirl.build(:event, address: nil)
    event.valid?

    expect(event.errors[:address]).to include("can't be blank")
  end

  it "is invalid without a date and time" do
    event = FactoryGirl.build(:event, date_time: nil)
    event.valid?

    expect(event.errors[:date_time]).to include("can't be blank")
  end

  it "is invalid without a user that created it" do
    event = FactoryGirl.build(:event, user: nil)
    event.valid?

    expect(event.errors[:user]).to include("can't be blank")
  end

  it "displays most recent events at the top"
end
