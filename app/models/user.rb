class User < ApplicationRecord

    has_many :characters
    has_many :adventures
    has_many :played_adventures, through: :characters,
        source: :adventure
    has_secure_password
    
    validates :email, presence: true
    validates :email, uniqueness: true
end
