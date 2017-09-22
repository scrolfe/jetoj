class Event < ApplicationRecord
  belongs_to :user

  has_attached_file :image, styles: { thumb: "260x160>" }, default_url: "/system/events/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates_presence_of :name, :branch, :address, :date_time, :user

  enum branch: {"Chicago":1, "Minneapolis":2}
  scope :branch, -> (branch) { where branch: branch }
end
