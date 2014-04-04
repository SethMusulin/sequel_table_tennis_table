require 'sequel'


class Tasks
  def initialize(database)
    @tasks = database[:tasks_table]
  end
  def add(arguments)
    #cnnect to db
    db = Sequel.connect('postgres://gschool_user:password@localhost:5432/tasks_test')
    #add task to db
    db[:tasks_table].insert(arguments)
  end
  def show
    db = Sequel.connect('postgres://gschool_user:password@localhost:5432/tasks_test')
    db[:tasks_table].to_a
  end
end