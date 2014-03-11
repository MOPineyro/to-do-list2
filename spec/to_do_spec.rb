require 'rspec'
require 'to_do'

describe 'Task' do

  before do
    Task.clear
  end

  it 'is initialized with a description' do
    test_task = Task.new 'this is a task description'
    test_task.should be_an_instance_of Task
  end

  describe '.create' do
    it 'makes a new instance of Task' do
      test_task = Task.create('wash the lion')
      test_task.should be_an_instance_of Task
    end

    it 'saves the Task' do
      test_task = Task.create('wash the lion')
      Task.all.should eq [test_task]
    end
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

  describe '#set_due_date' do
    it 'takes a date from user and applies it to the task' do
    test_task = Task.new('breathe fire')
    test_task.set_due_date('january 4th, 2050')
    test_task.due_date.should eq Date.parse('january 4th, 2050')
    end
  end

  describe '#set_priority' do
    it 'gives the task a priority setting from 1-10' do
      test_task = Task.new('dip the cat in the tub')
      test_task.set_priority('4')
      test_task.priority.should eq 4
    end
  end

end

describe 'List' do
  before do
    List.clear
  end

  it 'is initialized with a place to add tasks' do
    test_list = List.new('grocery list')
    test_list.should be_an_instance_of List
  end

  describe '.create' do
    it 'creates a new list' do
      test_list = List.create('chores')
      test_list.should be_an_instance_of List
    end

    it 'puts it into the list of lists' do
      test_list = List.create('chores')
      List.all.length.should eq 1
    end
  end



  describe '#add_task' do
    it 'adds a task to the current list' do
      test_list = List.new('games')
      task_to_add = test_list.add_task('monkee bizness')
      test_list.tasks.should eq task_to_add
    end
  end

  describe '#remove_task' do
    it 'removes the task from the current list' do
      test_list = List.new('games')
      task_to_add = test_list.add_task('monkee bizness')
      test_list.remove_task('1')
      test_list.tasks.should eq []
    end
  end

  describe '#sort' do
    it 'sorts the list of tasks by due date, priority, or description' do
      test_list = List.new('games')
      task_to_add = test_list.add_task('monkee bizness')
      test_list.tasks[0].set_priority('5')
      task_add = test_list.add_task('manuel bizness')
      test_list.tasks[1].set_priority('4')
      test_list.sort('p')
      test_list.tasks[0].description.should eq 'manuel bizness'
    end
  end
end



