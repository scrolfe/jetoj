require 'faker'

# Access seed_assets via: "#{Rails.root}/app/assets/images/seed_assets"

# Users
User.create(  email: 'test@user.com',
              password: 'foobar',
              password_confirmation: 'foobar',
              username: 'testuser',
              first_name: 'test',
              last_name: 'user',
              admin: true,
              avatar: File.new("#{Rails.root}/app/assets/images/seed_assets/user_avatars/user_avatar.jpg")
            )

# Events
gmaps = GoogleMapsService::Client.new(key: ENV['GOOGLE_API_KEY'])

7.times do
  date_time = Time.zone.parse("2017-11-12 07:00pm")
  end_time = Time.zone.parse(date_time.to_s) + 3600

  event = Event.new(
    name: "#{Faker::BossaNova.artist} in Chicago",
    description: "#{Faker::Lorem.paragraph}",
    address: {street_address: "5600 N Fairfield Ave", city: "Chicago", state: "IL", zip: "60659"},
    date_time: date_time,
    end_time: end_time,
    image: File.new("#{Rails.root}/app/assets/images/seed_assets/events_images/event_image.jpg"),
    user: User.first,
    branch: rand(2) + 1
    )

  results = gmaps.geocode("#{event.address['street_address']}, #{event.address['city']}, #{event.address['state']}")
  event.lat = results[0][:geometry][:location][:lat]
  event.lng = results[0][:geometry][:location][:lng]

  event.save!
end

# Posts
7.times do
  Post.create(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    image: File.new("#{Rails.root}/app/assets/images/seed_assets/posts_images/post_image.jpg"),
    user: User.first
  )
end

# Media
7.times do
  description = Faker::Lorem.sentence
  type_selector = rand(3)
  image_file = File.new("#{Rails.root}/app/assets/images/seed_assets/media_images/medium_image.jpg")
  audio_file = File.new("#{Rails.root}/app/assets/audio/seed_assets/audio/wave.mp3")

  case type_selector
  when 0
    Medium.create(
      user: User.first,
      medium_type: type_selector,
      image: image_file,
      youtube_id: nil,
      audio: nil,
      description: description,
    )
  when 1
    Medium.create(
      user: User.first,
      medium_type: type_selector,
      image: nil,
      youtube_id: "Zp_NxCyagaw",
      audio: nil,
      description: description,
    )
  when 2
    Medium.create(
      user: User.first,
      medium_type: type_selector,
      image: nil,
      youtube_id: nil,
      audio: audio_file,
      description: description,
    )
  end
end

# Performers
7.times do
  Performer.create(
    headshot: File.new("#{Rails.root}/app/assets/images/seed_assets/user_avatars/user_avatar.jpg"),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    bio: Faker::Lorem.paragraph,
    user: User.first,
    branch: rand(2) + 1
  )
end
