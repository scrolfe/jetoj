class Performer < ApplicationRecord
  belongs_to :user

  enum branch: {"Chicago":1, "Minneapolis":2}

  has_attached_file :headshot, styles: { thumb: "160x160#" }, default_url: "/system/users/images/:style/missing.png"
  validates_attachment_content_type :headshot, content_type: /\Aimage\/.*\z/

  scope :branch, -> (branch) { where branch: branch }

  def name
    [first_name, last_name].join(" ")
  end
end
