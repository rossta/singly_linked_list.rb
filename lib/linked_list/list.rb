module LinkedList
  class List
    attr_reader :head, :tail, :length

    def initialize
      reset
    end

    def empty?
      @head.nil?
    end

    def push(node)
      node = LinkedList::Node(node)
      @head ||= node
      @tail.next = node if @tail
      @tail = node
      @length += 1
      self
    end
    alias_method :<<, :push

    def unshift(node)
      node = LinkedList::Node(node)
      @tail ||= node
      node.next = @head if @head
      @head = node
      @length += 1
      self
    end

    def pop
      return nil if empty?

      value = @tail.value

      prev = nil
      curr = @head

      while curr
        prev = curr
        curr = curr.next
      end

      @tail = prev

      if @tail == @head
        reset
      else
        @tail.next = nil
        @length -= 1
      end

      value
    end

    def shift
      return nil if empty?

      value = @head.value

      if @tail == @head
        reset
      else
        @head = @head.next
        @length -= 1
      end

      value
    end

    def first
      head && head.value
    end

    def last
      tail && tail.value
    end

    def clear
      @head = nil
      @tail = nil
      @length = 0
    end
    alias_method :reset, :clear
  end
end
