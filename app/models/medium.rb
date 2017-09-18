class Medium < ApplicationRecord
  belongs_to :user

  has_attached_file :image, styles: { thumb: "260x160>" }, default_url: "/system/media/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_attached_file :audio
  validates_attachment_content_type :audio, content_type: [ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ]

  enum medium_type: {"photo":1, "video":2, "audio":3}

  scope :medium_type, -> (medium_type) { where medium_type: medium_type }
end
