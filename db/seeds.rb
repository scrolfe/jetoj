require 'faker'

# Access seed_assets via: "#{Rails.root}/app/assets/seed_assets"

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
    image: File.new("#{Rails.root}/app/assets/seed_assets/events_images/event_image.jpg")
    )
end

# Posts
3.times do
  Post.create(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    image: File.new("#{Rails.root}/app/assets/seed_assets/posts_images/post_image.jpg")
  )
end

# Media
3.times do
  Medium.create(
    youtube_id: "Zp_NxCyagaw",
    description: "#{Faker::Lorem.sentence}",
    image: File.new("#{Rails.root}/app/assets/seed_assets/media_images/medium_image.jpg")
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
              avatar: File.new("#{Rails.root}/app/assets/seed_assets/user_avatars/user_avatar.jpg")
            )
