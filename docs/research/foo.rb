require 'async'

def sleepy(duration, task: Async::Task.current)
  task.async do |subtask|
    subtask.annotate "I'm going to sleep #{duration}s..."
    subtask.sleep duration
    puts "I'm done sleeping!"
  end
end

def nested_sleepy(task: Async::Task.current)
  task.async do |subtask|
    subtask.annotate "Invoking sleepy 5 times..."
    5.times do |index|
      sleepy(index, task: subtask)
    end
  end
end

Async do |task|
  task.annotate "Invoking nested_sleepy..."
  subtask = nested_sleepy

  # Print out all running tasks in a tree:
  task.print_hierarchy($stderr)

  # Kill the subtask
  # subtask.stop
end
