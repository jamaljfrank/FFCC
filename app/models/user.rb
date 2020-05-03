class User < ApplicationRecord
    has_many :characters
    has_many :adventures
    has_many :played_adventures, through: :characters,
        source: :adventure
end
