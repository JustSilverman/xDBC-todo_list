require './list_item'
require './user_interface'
require './database'

class MiddleMan

  def initialize(args)
    @id             = args[:id]
    @action         = args[:action]
    @task           = args[:task]
    @status         = args[:status]
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
  end

  def task_args
    {:id => @id, :task => @task, :status => @status}
  end

  def add(task)
    @database.add_item(ListItem.new(task_args))
    @user_interface.confirm_add(@task)
  end

  def get_list
    @list = @database.get_list
  end

  def send_list
    @user_interface.dislay_list(@list)
  end
 
  def delete(id)
    @database.delete(@id)
    @user_interface.confirm_delete(@task)
  end

  def complete(id)
    @database.complete_item(@id)
    @user_interface.confirm_complete(@task)
  end
end
