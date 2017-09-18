require 'faker'

# Access seed_assets via: "#{Rails.root}/app/assets/images/seed_assets"

# Events
3.times do
  city = Faker::Address.city
  state = Faker::Address.state_abbr
  zip = Faker::Address.zip
  date_time = DateTime.new(2018, (rand(12) + 1), (rand(28) + 1), (rand(12) + 1), 30)

  Event.create(
    name: "#{Faker::BossaNova.artist} in #{city}",
    description: "#{Faker::Lorem.paragraph}",
    location: "#{Faker::Address.street_address}, #{city}, #{state} #{zip}",
    date_time: "#{date_time}",
    image: File.new("#{Rails.root}/app/assets/images/seed_assets/events_images/event_image.jpg"),
    user: User.first
    )
end

# Posts
3.times do
  Post.create(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    image: File.new("#{Rails.root}/app/assets/images/seed_assets/posts_images/post_image.jpg"),
    user: User.first
  )
end

# Users
User.create(  email: 'test@user.com',
              password: 'foobar',
              password_confirmation: 'foobar',
              username: 'testuser',
              first_name: 'test',
              last_name: 'user',
              bio: Faker::Lorem.sentence,
              admin: true,
              avatar: File.new("#{Rails.root}/app/assets/images/seed_assets/user_avatars/user_avatar.jpg")
            )

# Media
2.times do
    Medium.create(
    youtube_id: "Zp_NxCyagaw",
    description: "#{Faker::Lorem.sentence}",
    medium_type: 'video',
    user: User.first
  )
end

2.times do
  Medium.create(
    youtube_id: "",
    description: "#{Faker::Lorem.sentence}",
    image: File.new("#{Rails.root}/app/assets/images/seed_assets/media_images/medium_image.jpg"),
    medium_type: 'photo',
    user: User.first
  )
end

# Performers
5.times do
  Performer.create(
    headshot: File.new("#{Rails.root}/app/assets/images/seed_assets/user_avatars/user_avatar.jpg"),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    bio: Faker::Lorem.paragraph,
    user: User.first
  )
end
