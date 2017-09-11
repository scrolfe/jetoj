require 'faker'

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
    date_time: "#{date_time}"
    )
end

# Posts
3.times do
  Post.create(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
  )
end

# Media
3.times do
  Medium.create(
    youtube_id: "Zp_NxCyagaw",
    description: "#{Faker::Lorem.sentence}"
  )
end
