class Post < ApplicationRecord
  belongs_to :user

  has_attached_file :image, styles: { medium: "800x600>", thumb: "260x160>" }, default_url: "/system/posts/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
