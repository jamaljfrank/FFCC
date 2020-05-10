class Adventure < ApplicationRecord
    belongs_to :user
    has_many :characters
    has_many :users, through: :characters

    validates :title, presence: true
    validates :title, uniqueness: true
    validates :flavor, presence: true
    validates :flavor, uniqueness: true
    #scope :completed, -> {where(completed: = "true")}

    
end
