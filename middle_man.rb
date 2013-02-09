require './list_item'
require './user_interface'
require './database'

class MiddleMan

  def initialize(args)
    @id             = args[:id]
    @action         = args[:action]
    @task           = args[:task]
    @database       = Database.new('todo.txt')
    @user_interface = UserInterface.new
    execute!
  end

  def execute!
    if @action == "add"
      self.add(@task)
    elsif @action == "list"
      self.get_list
      self.send_list
    elsif @action == "delete"
      self.delete(@id)
    elsif @action == "complete"
      self.complete(@id)
    else
      puts "Command not recognized."
    end
    @database.save
  end

  def default_task_args
    {"id" => @id, "task" => @task, "status" => :incomplete}
  end

  def add(task)
    @database.add_item(ListItem.new(default_task_args))
    @user_interface.confirm_add(@task)
  end

  def get_list
    @list = @database.get_list
  end

  def send_list
    @user_interface.display_list(@list)
  end
 
  def delete(id)
    item = @database.get_item(id)
    @database.delete(item.id)
    @user_interface.confirm_delete(item.task)
  end

  def complete(id)
    item = @database.get_item(id)
    @database.complete_item(item.id)
    @user_interface.confirm_complete(item.task)
  end
end
