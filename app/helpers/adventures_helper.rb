module AdventuresHelper
    def status(adventure)
        adventure.completed ? "Completed!" : "New"
    end

    def complete_adventure
        current_adventure.toggle!(:completed) 
    end

    def requirements_met?
        current_user.characters.count >= current_adventure.reqs
    end
end
