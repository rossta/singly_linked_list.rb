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
      self
    end
    alias_method :<<, :push

    def unshift(node)
      @tail ||= node
      node.next = @head if @head
      @head = node
      @length += 1
      self
    end

    def first
      head && head.value
    end

    def last
      tail && tail.value
    end
  end
end
