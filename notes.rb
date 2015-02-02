class Queue
  def initialize
    @store = []
  end
  def add(obj)
    @store.push(obj)
  end
  def remove
    @store.shift
  end
  def peek
    @store.first
  end
end

