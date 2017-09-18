class Event < ApplicationRecord
  belongs_to :user

  enum branch: {"Chicago":1, "Minneapolis":2}

  has_attached_file :image, styles: { thumb: "260x160>" }, default_url: "/system/events/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  scope :branch, -> (branch) { where branch: branch }
end
