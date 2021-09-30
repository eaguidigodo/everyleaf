FactoryBot.define do
  factory :task do
    name { 'Title 1 made by Factory' }
    detail { 'Default content created by Factory 1' }
  end
  # Name the test data to be created "second_task"
  # (If you want to name a class that does not exist, optionally specify "Please use test data for this class")
  factory :second_task, class: Task do
    name { 'Title 2 made by Factory' }
    detail { 'Default content 2 made by Factory' }
  end
end