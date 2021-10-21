class Tag < ApplicationRecord
    has_many :task_tag_relations
    has_many :tasks, through: :task_tag_relations

    validates :name, uniqueness: true
end
