class Adventure < ApplicationRecord
    belongs_to :user
    has_many :characters
    has_many :users, through: :characters

    validates :title, presence: true
    validates :title, uniqueness: true
    validates :flavor, presence: true
    validates :flavor, uniqueness: true
    #scope :completed_quests, -> {where(completed: = "true")}

    def complete_adventure
        @adventure = Adventure.find_by(:id => params[:id])
        if current_user.characters.count >= @adventure.reqs 
            adventure.toggle!(:completed) 
        end
    end
end
