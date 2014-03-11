require './lib/to_do'

@list_of_lists = []

def main_menu
  puts "Press 'a' to add a task, 'l' to list all of your tasks, or 'd' to mark task done and remove it from the list."
  puts "Press 'x' to exit."
  main_choice = gets.chomp
  if main_choice == 'a'
    add_task
  elsif main_choice == 'l'
    list_tasks
  elsif main_choice == 'd'
    delete_task
  elsif main_choice == 'x'
    puts "Good-bye!"
  else
    puts "Sorry, that wasn't a valid option."
    main_menu
  end
end

def add_task
  puts "Enter a description of the new task:"
  user_description = gets.chomp
  @list << Task.new(user_description)
  puts "Task added.\n\n"
  main_menu
end

def list_tasks
  puts "Here are all of your tasks:"
  @list.each_with_index do |task, index|
    puts "#{index + 1}. #{task.description}\n"
  end
  puts "\n"
  main_menu
end

def delete_task
  puts "Which task would you like to delete? \n"
  @list.each_with_index do |task, index|
    puts "#{index + 1}. #{task.description}\n"
  end
  task_to_delete = gets.chomp.to_i
  @list[task_to_delete - 1].marked_done
  @list.delete(@list[task_to_delete - 1])
  main_menu
end
main_menu
