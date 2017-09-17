class Medium < ApplicationRecord
  belongs_to :user

  has_attached_file :image, styles: { thumb: "260x160>" }, default_url: "/system/media/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
