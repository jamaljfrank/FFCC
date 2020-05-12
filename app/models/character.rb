class Character < ApplicationRecord
    belongs_to :user
    belongs_to :adventure

    validates :name, presence: true
    validates :name, uniqueness: true
    validates :tribe, presence: true
    
    scope :led_by, ->(user_id) {where("user_id = ?", user_id)}
end
