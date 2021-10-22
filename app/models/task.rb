class Task < ApplicationRecord
    belongs_to :user
    has_many :task_tag_relations
    has_many :tags, through: :task_tag_relations

    validates :name, :detail, :deadline, presence: true
    validates :name, uniqueness: true

    enum priority: {  Low: 0, Medium: 1, High: 2 }

    scope :search, -> (param) { where("name LIKE ?" , "%#{param}%") }

    scope :label_search, -> (param) { 

        tasks = TaskTagRelation.where(tag_id: Tag.where(name: param).ids)
         idss = tasks.map{ |task| task.task_id } 
         where(id: idss) 
    }

    scope :search_status, -> (param) { where(status: param) }

    def all_tags=(names)
        self.tags = names.split(",").map do |name|
            Tag.where(name: name.strip).first_or_create!
        end
    end

    def all_tags
        self.tags.map(&:name).join(",")
    end
end
