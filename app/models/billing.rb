class Billing < ApplicationRecord
  belongs_to :user
  has_many :payments

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :province, presence: true
  validates :postal_code, presence: true  
end
