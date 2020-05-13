class Character < ApplicationRecord
    belongs_to :user
    has_many :battles
    has_many :adventures, through: :battles

    validates :name, presence: true
    validates :name, uniqueness: true
    validates :tribe, presence: true
    
    scope :led_by, ->(user_id) {where("user_id = ?", user_id)}
end
