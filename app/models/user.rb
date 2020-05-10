class User < ApplicationRecord

    has_many :characters
    has_many :adventures, through: :characters
    # has_many :played_adventures, through: :characters,
    #     source: :adventure
    has_secure_password
    
    validates :email, presence: true
    validates :email, uniqueness: true

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
            user.email = auth.info.email
            user.password = SecureRandom.hex
        end
    end
end
