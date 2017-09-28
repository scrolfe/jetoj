class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events
  has_many :media
  has_many :posts
  has_many :performers

  has_attached_file :avatar, styles: { thumb: "160x160#" }, default_url: "/system/users/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def name
    [first_name, last_name].join(" ")
  end
end
