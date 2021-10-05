class Task < ApplicationRecord
    validates :name, :detail, :deadline, presence: true

    def self.search(search)
        if search
            @tasks_searched = Task.where("name LIKE ?" , "%#{search}%")
        end
    end
end
