module AdventuresHelper
    def status(adventure)
        adventure.completed ? "Completed!" : "New"
    end

    def complete_adventure(adventure)
        if current_user.characters.count >= adventure.reqs 
            adventure.toggle!(:completed) 
        end
    end
end
