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
7.times do
  city = Faker::Address.city
  state = Faker::Address.state_abbr
  zip = Faker::Address.zip
  date_time = DateTime.new(2018, (rand(12) + 1), (rand(28) + 1), (rand(12) + 1), 30)

  Event.create(
    name: "#{Faker::BossaNova.artist} in #{city}",
    description: "#{Faker::Lorem.paragraph}",
    address: {street_address: Faker::Address.street_address, city: city, state: state, zip: zip},
    date_time: "#{date_time}",
    image: File.new("#{Rails.root}/app/assets/images/seed_assets/events_images/event_image.jpg"),
    user: User.first,
    branch: rand(2) + 1
    )
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
