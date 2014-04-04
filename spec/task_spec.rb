require 'tasks'

describe Tasks do
  it "manages tasks" do
    db = Sequel.connect('postgres://gschool_user:password@localhost:5432/tasks_test')
    db.create_table! :tasks_table do
      primary_key :id
      String :task
      FalseClass :completed, :default => false
    end

  tasks = Tasks.new(db)
  tasks.add({:task => "clean car"})
  tasks.add({:task => "eat", :completed => true})
  expect(tasks.show).to eq [{:id => 1, :task => "clean car", :completed => false}, {:id => 2, :task => "eat", :completed => true}]
  end

end