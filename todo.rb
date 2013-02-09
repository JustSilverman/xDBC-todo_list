require './middle_man'

input = ARGV
action = input.first

if action == "add"
  args = { :task => input[1..input.length-1].join(" "), :action => action.to_s }
elsif action == "delete"
  args = { :id => input[1], :action => action.to_s }
elsif action == "complete"
  args = { :id => input[1], :action => action.to_s }
elsif action == "list"
  args = { :action => action.to_s }
end

MiddleMan.new(args)

