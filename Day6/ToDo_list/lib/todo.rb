require 'date'

class Todolist

  attr_reader :tasks, :user

    def initialize(user)
      @tasks = []
      @users = user
    end

    def add_task(task)
      @tasks << task
    end

    def delete_task(dlt_id)
      @tasks.delete_if { |task| task.id == dlt_id}
    end

    def find_task_by_id(chec_id)
      slct_id = @tasks.find { |task| task.id == chec_id}
      # slct_id ? slct_id : nil
      if slct_id 
        slct_id
      else
        nil
      end
    end

    def sort_by_created
      sorted_tasks = tasks.sort { |task1, task2| task1.created_at <=> task2.created_at }
    end

end

class Task
  
  @@id_control = 1

  attr_reader :content, :id, :created_at, :complete, :updated_at

  def initialize(content)
    @content = content
    @id = @@id_control +=1
    @created_at = Time.now
    @complete = false
    @updated_at = nil
  end

  def make_incomplete!
    @complete = false
  end

  def completed_task?
    @complete == true ? true : false
  end
  
  def complete!
    @complete = true
  end

  def update_task!(new_content) #Este método devuelve el último elemento
    @content = new_content
    @updated_at = Time.now
  end

end

agenda = Todolist.new("Juan")
agenda.add_task(Task.new("Walk the dog"))
agenda.add_task(Task.new("Buy the milk"))
task = agenda.find_task_by_id(1)
#puts task.content

puts agenda.find_task_by_id(1)

task1 = Task.new("Buy the milk")
puts task1.id
# # 1
task2 = Task.new("Wash the car")
task3 = Task.new("Drink coffee")
puts task2.id
# # 2
agenda.add_task(task1)
agenda.add_task(task2)
agenda.add_task(task3)
#todolist.save

puts agenda
