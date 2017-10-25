require 'google_maps_service'

class Event < ApplicationRecord
  belongs_to :user

  has_attached_file :image, styles: { thumb: "260x160>" }, default_url: "/system/events/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates_presence_of :name, :description, :branch, :address, :date_time, :user

  enum branch: {"Chicago":1, "Minneapolis":2}
  scope :branch, -> (branch) { where branch: branch }

  def self.set_coords(event)
    gmaps = GoogleMapsService::Client.new(key: ENV['GOOGLE_API_KEY'])
    p "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    p "GMaps instantiated. Now calling geocode method."
    results = gmaps.geocode("#{event.address['street_address']}, #{event.address['city']}, #{event.address['state']}")
    p "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1"
    p "Geocode successful"
    p results
    p '!!!!!!!!!!!!!!!!!!!!'
    p results[0]
    if results[0]
      {lat: results[0][:geometry][:location][:lat], lng: results[0][:geometry][:location][:lng]}
    else
      render 'events/new', flash: { error: "Incorrect address." }
    end
  end
end
