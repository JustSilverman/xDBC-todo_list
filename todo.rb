require './middle_man'

class ToDo
  def self.run(commands)
    action = commands.first

    if action == "add"
      args = { :task => commands[1..commands.length-1].join(" "), :action => action.to_s }
    elsif action == "delete"
      args = { :id => commands[1], :action => action.to_s }
    elsif action == "complete"
      args = { :id => commands[1], :action => action.to_s }
    else
      args = { :action => action.to_s }
    end

    MiddleMan.new(args)

  end
end

commands = ARGV
ToDo.run(commands)
