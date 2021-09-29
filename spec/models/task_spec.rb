require 'rails_helper'
RSpec.describe 'Task model function', type: :model do
  describe 'Validation test' do
    context 'If the task Name is empty' do
      it "Task must not be registered" do
        task = Task.new(name: '', detail: 'Failure test')
        expect(task).not_to be_valid
      end
    end
    context 'If the task details are empty' do
      it 'Validation is caught' do
        task = Task.new(name: 'rspec', detail:'')
        expect(task).not_to be_valid
      end
    end
    context 'If the task Title and details are described' do
      it 'Validation passes' do
        task = Task.new(name: 'rspec', detail:'this validation must pass')
      end
    end
  end
end
