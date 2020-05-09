class Adventure < ApplicationRecord
    belongs_to :user
    has_many :characters
    has_many :users, through: :characters

    # Add validations
    def adventure_index
        Adventure.all.each do |adv| 
            link_to adv.title, adventure_path(adv) 
            <br>
            <br>
            adv.flavor
        end
        
    end
end
