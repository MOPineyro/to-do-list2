require 'date'

class Task
  @@all_tasks = []

  def Task.create(description)
    task = Task.new(description)
    @@all_tasks << task
    task
  end

  def Task.all
    @@all_tasks
  end

  def Task.clear
    @@all_tasks =[]
  end

  def initialize(description)
    @description = description
  end

  def description
    @description
  end

  def marked_done
    @marked_done = true
  end

  def set_due_date(date)
    @due_date = Date.parse(date)
  end

  def due_date
    @due_date
  end

  def set_priority(number)
    if number.to_i > 10 || number.to_i < 0
      puts 'Please enter a priority from 1-10 only'
    else
      @priority = number.to_i
    end
  end

  def priority
    @priority
  end

end

class List
  @@list_of_lists = []

  def List.all
    @@list_of_lists
  end

  def List.clear
    @@list_of_lists = []
  end

  def List.create(list_name)
    list = List.new(list_name)
    @@list_of_lists << list_name
    list
  end

  def initialize(list_name)
    @list_name = list_name
    @tasks = []
  end

  def tasks
    @tasks
  end

  def list_name
    @list_name
  end

  def add_task(description)
    @tasks << Task.create(description)
  end

  def list_tasks
    @tasks.each_with_index do |task, index|
      puts "#{index + 1}. #{task.description}\n"
    end
  end

  def remove_task(number)
    @tasks.delete(@tasks[number.to_i-1])
  end

  def sort(sort_type)
    if sort_type == "p"
      @tasks.sort_by!{|task| task.priority}
    elsif sort_type == "d"
      @tasks.sort_by!{|task| task.description}
    elsif sort_type == 'dd'
      @tasks.sort_by!{|task| task.due_date}
    else
      puts 'Please choose one of the following: p- priority, d- description, dd due_date'
    end
  end
end








