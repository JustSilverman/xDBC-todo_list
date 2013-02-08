require './todo_parser'
require './list'
require './list_item'

class Database
  
  COMPLETION = [:complete => "[X]", :incomplete => "[ ]"]
  attr_reader :parser, :file

  def initialize(file)
    @file   = file
    @parser = TodoParser
    @list   = create_list
  end

  def add_item(list_item)
    list.add_item(list_item)
  end

  def get_list
    list
  end

  def create_list
    list = List.new
    self.parser.each_entry do |item_data|
      list.add_item(ListItem.new(item_data))
    end
    list
  end

  def delete(id)
    list.remove(id)
  end

  def complete(id)
    item = list.find(id)
    item.status = :complete
  end

  def save
    File.open(file, "w") do |file|
      list.each_with_index do |item, idx|
        file.write("#{idx + 1}. #{COMPLETION[item.status]} #{item.task}")
      end
    end
  end

end
 # new comment
# Reminder list
# id integer or string
# delete 
