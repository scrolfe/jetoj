FactoryGirl.define do
  factory :event do
    name "Test Event Name"
    description "Test Event Description"
    date_time DateTime.new(2017, 10, 30, 10, 30) # 10:30 am on Oct 30, 2017
    end_time Time.new()
    image File.new("#{Rails.root}/app/assets/images/seed_assets/events_images/event_image.jpg")
    address [street_address: "1234 Test Street", city: "Test City", state: "Madeup", zip: "54321"]
    branch {rand(1..2)}
  end
end
