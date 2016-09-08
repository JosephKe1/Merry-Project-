class User < ApplicationRecord
  has_secure_password
  has_many :payments
  has_many :billings 

  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: VALID_EMAIL_REGEX
  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :avatar, attachment_presence: true

  def name
  "#{first_name}".titleize
  end

  def full_name
    "#{first_name} #{last_name}".squeeze(" ").strip.titleize
  end

  has_attached_file :avatar, styles: { medium: "300x300#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
