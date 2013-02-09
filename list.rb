class List
  attr_reader :list_items

  def initialize
    @list_items = []
  end

  def add_item(item)
    @list_items << item
  end

  def find(id)
    @list_items.find { |item| item.id == id }
  end

  def remove(id)
    @list_items.delete(find(id))
  end
end
