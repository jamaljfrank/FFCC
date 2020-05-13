class Adventure < ApplicationRecord
    belongs_to :user
    has_many :battles
    has_many :characters, through: :battles

    validates :title, presence: true
    validates :title, uniqueness: true
    validates :flavor, presence: true
    validates :flavor, uniqueness: true
    


end
