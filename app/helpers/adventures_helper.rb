module AdventuresHelper
    def status(adventure)
        adventure.completed ? "Completed!" : "New"
    end
end
