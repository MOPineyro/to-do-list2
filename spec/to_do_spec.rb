require 'rspec'
require 'to_do'


describe 'Task' do
  it 'is initialized with a description' do
    test_task = Task.new 'this is a task description'
    test_task.should be_an_instance_of Task
  end

  describe '#description' do
    it 'lets you read the description out' do
      test_task = Task.new('scrub the zebra')
      test_task.description.should eq 'scrub the zebra'
    end
  end

  describe '#marked_done' do
    it 'marks a task as complete and removes the task from the list' do
      test_task = Task.new('kick a donkey')
      test_task.marked_done.should eq true
    end
  end
end

describe 'List' do
  it 'is initialized with a place to add tasks' do
    test_list = List.new('grocery list')
    test_list.should be_an_instance_of List
  end

  describe '#add_task' do
    it 'adds a task to the current list' do
      test_list = List.new('games')
      task_to_add = Task.new('monkee bizness')
      test_list.add_task(task_to_add)
      test_list.tasks.should eq [task_to_add]
    end
  end
end



