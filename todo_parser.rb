class TodoParser
  def self.each_entry(path)
    File.open(path, "r").each_line do |line|
      yield parse_line(line)
    end
  end

  private
  def self.parse_line(line)
    match = line.chomp.match(/^(?<id>\d+)\.\s(?<status>.{3})\s+(?<task>.+)$/)
    Hash[match.names.zip(match.captures)]
  end
end
