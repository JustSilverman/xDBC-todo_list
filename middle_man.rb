require './list_item'
require './user_interface'
require './database'

class MiddleMan
  attr_reader :id, :action, :task, :database, :user_interface

  def initialize(args)
    @id             = args[:id]
    @action         = args[:action]
    @task           = args[:task]
    @database       = Database.new('todo.txt')
    @user_interface = UserInterface.new
    execute!
  end

  def execute!
    if self.respond_to?(action.to_sym)
      if self.send(action.to_sym)
        database.save
      else
        user_interface.invalid_id
      end 
    else
      user_interface.non_action
    end
  end

  def default_task_args
    {"id" => id, "task" => task, "status" => :incomplete}
  end

  def add
    database.add_item(ListItem.new(default_task_args))
    user_interface.confirm_add(task)
    true
  end

  def get_list
    database.get_list
  end

  def list
    user_interface.display_list(get_list)
  end
 
  def delete
    item = database.get_item(id)
    return false if item.nil?

    database.delete(item.id)
    user_interface.confirm_delete(item.task)
    true
  end

  def complete
    item = database.get_item(id)
    return false if item.nil?

    database.complete_item(item.id)
    user_interface.confirm_complete(item.task)
    true
  end
end
