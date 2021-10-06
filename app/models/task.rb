class Task < ApplicationRecord
    validates :name, :detail, :deadline, presence: true

    scope :search, -> (param) { where("name LIKE ?" , "%#{param}%") }

    scope :search_status, -> (param) { where(status: param) }
end
