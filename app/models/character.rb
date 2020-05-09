class Character < ApplicationRecord
    belongs_to :user
    belongs_to :adventure

    validates :name, presence: true
    validates :name, uniqueness: true
    validates :tribe, presence: true
    validates :tribe, uniqueness: true
end
