class Node
  attr_accessor :value, :next
  def intiialize(value = nil)
    @value = value
  end
  def to_s
    @value
  end
end

class SinglyLinkedList
  attr_accessor :head
  def initialize(first_val = nil)
    @head = Node.new(first_val) if first_val
  end
  def add(value)
    if head.nil?
      head = Node.new(value)
    else
      current_node = @head
      while current_node.next
        current_node = current_node.next
      end
      current_node.next = Node.new(value)
    end
  end


