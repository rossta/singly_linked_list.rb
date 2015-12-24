module LinkedList
  Node = Struct.new(:value, :next)

  def Node(object)
    return object if object.is_a?(Node)
    Node.new(object)
  end
  module_function :Node
end
