class Task < ApplicationRecord
    validates :name, :detail, :deadline, presence: true
end
