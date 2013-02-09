class UserInterface
  COMPLETION = {:complete => "[X]", :incomplete => "[ ]"}

  def display_list(list)
    list.list_items.each do |item|
      puts "#{item.id}.".ljust(4) + " #{COMPLETION[item.status]} #{item.task}"
    end
  end

  def confirm_add(task)
    puts "Appended #{task} to your TODO list..."
  end

  def confirm_delete(task)
    puts "Deleted #{task} from your TODO list..."
  end

  def confirm_complete(task)
    puts "#{task} has been marked as complete!"
  end

  def non_action
    puts "Command not recognized."
  end
end
