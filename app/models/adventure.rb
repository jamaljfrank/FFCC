class Adventure < ApplicationRecord
    belongs_to :user
    has_many :characters
    has_many :users, through: :characters

    # Add validations
end
