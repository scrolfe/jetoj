class Performer < ApplicationRecord
  belongs_to :user

  has_attached_file :headshot, styles: { thumb: "160x160#" }, default_url: "/system/users/images/:style/missing.png"
  validates_attachment_content_type :headshot, content_type: /\Aimage\/.*\z/

  def name
    [first_name, last_name].join(" ")
  end
end
