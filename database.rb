require './todo_parser'
require './list'
require './list_item'

class Database
  
  COMPLETION = {:complete => "[X]", :incomplete => "[ ]"}
  attr_reader :parser, :file, :list

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

  def get_item(id)
    list.find(id)
  end

  def create_list
    list = List.new
    parser.each_entry(file) do |item_data|
      item_data["status"] = convert_status(item_data)
      list.add_item(ListItem.new(item_data))
    end
    list
  end

  def delete(id)
    list.remove(id)
  end

  def complete_item(id)
    item = list.find(id)
    item.completed!
  end

  def save
    File.open(file, "w") do |file|
      list.list_items.each_with_index do |item, idx|
        file.write("#{idx + 1}. #{COMPLETION[item.status]} #{item.task}\n")
      end
    end
  end

  def convert_status(item_data)
    if item_data["status"] == "[ ]"
      :incomplete
    else
      :complete
    end
  end
end
