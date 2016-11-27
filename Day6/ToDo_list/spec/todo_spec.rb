require 'spec_helper'
require 'date'
require 'pry'

describe Task do

	let (:task) { Task.new("Get bread") }

  describe "#complete?" do
    it "returns false by default" do
      expect(task.completed_task?).to eq(false)
    end
  end
  	
  describe "#complete!" do
  	it "returns that the task is completed" do
  		expect(task.complete!).to eq(true)
    end
  end

  describe "make_incomplete!" do
  	it "returns to a task to a incomplete status" do
  		expect(task.make_incomplete!).to eq(false)
  	end
  end

  describe "update_task!" do
  	it "corrects the text in content" do
  		task.update_task!("new string")
  		expect(task.content).to eq (task.content)
  	end
  end
end

describe Todolist do

	let (:agenda) { Todolist.new("New list") }
	let (:task) { Task.new("Get bread") }

  describe "add_task" do
    it "comfirms that our task is added" do
      expect(agenda.add_task("Do homework")).to eq(["Do homework"])
    end
  end

  describe "todo_list.delete_task(1) by length" do
  	it "Deletes a task by id" do
  		task = Task.new("Walk the dog")
  		agenda.add_task(task)
  		agenda.delete_task(task.id)
  		expect(agenda.tasks.length).to eq(0)
  	end
  end

  # describe "todo_list.delete_task(1) by id" do
  # 	it "Deletes a task by id" do
  # 		task = Task.new("Walk the dog")
  # 		agenda.add_task(task)
  # 		agenda.delete_task(1)
  # 		expect(agenda(task)).to include(task)
  # 	end
  # end

  describe "find_by_id" do
  	it "find task by id" do
  		agenda.add_task(task)	
  		expect(agenda.find_task_by_id(task.id)).to eq(task)
  	end    
  end

  describe "find_by_id_nil" do
    it "find task by id returns nil" do
      expect(agenda.find_task_by_id(task.id)).to eq(nil)
    end    
  end

  # describe "sort_by_updated_at" do
  #   it "sort list by updated_at method" do
  #     task1 = Task.new("Buy the milk")
  #     task2 = Task.new("Wash the car")
  #     task3 = Task.new("Drink coffee")
  #     agenda.add_task(task1)
  #     agenda.add_task(task2)
  #     agenda.add_task(task3)
  #     agenda.sort_by_updated_at
  #     expect(agenda.tasks[0].created_at)to be <= agenda.tasks[1].created_at
  #   end
  # end

end
