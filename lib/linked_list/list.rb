module LinkedList
  class List
    attr_reader :head, :tail, :length

    def initialize
      @head = nil
      @tail = nil
      @length = 0
    end

    def empty?
      @head.nil?
    end

    def push(node)
      @head ||= node
      @tail.next = node if @tail
      @tail = node
      @length += 1
      @tail
    end
    alias_method :<<, :push
  end
end
