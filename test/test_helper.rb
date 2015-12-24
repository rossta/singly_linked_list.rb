$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'linked_list'

require 'minitest/autorun'

class Minitest::Spec
  def create_node(*args)
    LinkedList::Node.new(*args)
  end

  def create_list
    LinkedList::List.new
  end
end
