class TodoParser
  def self.each_entry(path)
    File.open(path, "r").each_line do |line|
      yield parse_line(line)
    end
  end

  private
  def self.parse_line(line)
    
    match = line.chomp.match(/^(?<id>\d+)\.\s(?<status>.{3})\s+(?<description>.+)$/)

    Hash[match.names.zip(match.captures)]

  end
end

# list = []
# TodoParser.each_entry('todo.txt') do |list_item|
#   list << list_item
# end

# TodoParser.each_entry('todo.txt') do |list_item|
#   p list_item if list_item['id'] == '1'
# end

# File.open('todo.txt', "a") do |file|
#   file << "#{15}. [X] call mom\n"
# end
# # p File.foreach('todo.txt').inject(0) {|c, line| c+1}
