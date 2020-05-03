class User < ApplicationRecord
    has_many :characters
    has_many :adventures
    has_many :undertook_adventures, through: :characters
end
