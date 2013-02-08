class List
  attr_reader :list_item

  def initialize
    @list_items = []
  end

  def add_item(item)
    @list_items << item
  end

  def find(id)
    @list_items.find { |item| item.id == id }
  end

  def remove(item)
    @list_items.delete(item)
  end
end
