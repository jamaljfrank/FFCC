class User < ApplicationRecord
  has_many :characters
  has_many :adventures
  has_many :battles, through: :characters

  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
      user.email = auth.info.email
      user.password = SecureRandom.hex
    end
  end
end
