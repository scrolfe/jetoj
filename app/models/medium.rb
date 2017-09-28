class Medium < ApplicationRecord
  belongs_to :user

  has_attached_file :image, styles: { thumb: "260x160>" }, default_url: "/system/media/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_attached_file :audio
  validates_attachment_content_type :audio, content_type: [ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ]

  validates_presence_of :medium_type

  with_options if: :is_type_photo? do |medium|
    medium.validates :image_file_name, presence: true
    medium.validates :audio_file_name, :youtube_id, absence: true
  end

  with_options if: :is_type_video? do |medium|
    medium.validates :youtube_id, presence: true
    medium.validates :image_file_name, :audio_file_name, absence: true
  end

  with_options if: :is_type_audio? do |medium|
    medium.validates :audio_file_name, presence: true
    medium.validates :image_file_name, :youtube_id, absence: true
  end

  enum medium_type: {"photo":1, "video":2, "audio":3}

  def is_type_photo?
    medium_type == "photo"
  end

  def is_type_video?
    medium_type == "video"
  end

  def is_type_audio?
    medium_type == "audio"
  end

  scope :photo, -> { where medium_type: "photo" }
  scope :video, -> { where medium_type: "video" }
  scope :audio, -> { where medium_type: "audio" }
end
