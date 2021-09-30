require 'rails_helper'
RSpec.describe 'Task management function', type: :system do
    before do
        FactoryBot.create(:task)
        FactoryBot.create(:second_task)
        visit tasks_path
    end

  describe 'New creation function' do
    context 'When creating a new task' do
      it 'The created task is displayed' do
        visit new_task_path
        fill_in 'task[name]', with: "rails"
        fill_in 'task[detail]', with: "Ruby on rails"
        click_on 'Create Task'
        expect(page).to have_content 'on rails'
      end
    end
  end
  describe 'List display function' do
    context 'When transitioning to the list screen' do
      it 'The created task list is displayed' do
        #task = FactoryBot.create(:task, name: 'task', detail: 'task details')
        visit tasks_path
        expect(page).to have_content 'made by'
      end
    end
  end

  context 'When tasks are arranged in descending order of creation date and time' do
    it 'New task is displayed at the top' do
      visit tasks_path
     task_list = all('.task_row') 
      expect(task_list[0]).to  have_content "Title 2 made by Factory"
    end
  end

  describe 'Detailed display function' do
     context 'When transitioned to any task details screen' do
       it 'The content of the relevant task is displayed' do
       end
     end
  end


#   background do
#     FactoryBot.create(:task, title: 'Added name 1')
#     FactoryBot.create(:task, title: 'Added name 2')
#     FactoryBot.create(:second_task, title: 'Added name 3', content: 'Added content')
#   end
end