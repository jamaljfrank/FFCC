class Adventure < ApplicationRecord
    belongs_to :user
    has_many :characters
    has_many :users, through: :characters

    validates :title, presence: true
    validates :title, uniqueness: true
    validates :flavor, presence: true
    validates :flavor, uniqueness: true
    #scope :completed_quests, -> {where(completed: = "true")}

    def requirements_met?
        current_user.characters.count >= self.reqs ? true : false
    end

    def complete_adventure
        if requirements_met?
            self.toggle!(:completed)
            "Adventure Completed!"
        else
            "Sorry, your party is too small."
        end 
    end
end
