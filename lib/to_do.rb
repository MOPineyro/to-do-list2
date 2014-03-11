class Task
  def initialize(description)
    @description = description
  end

  def description
    @description
  end

  def marked_done
    @marked_done = true
  end
end

class List
  def initialize(list_name)
    @list_name = list_name
    @tasks = []
  end

  def tasks
    @tasks
  end

  def add_task(task_to_add)
    @tasks << task_to_add
  end
end
