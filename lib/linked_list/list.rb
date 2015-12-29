module LinkedList
  class List
    include Enumerable

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

    def reverse
      LinkedList::List(to_a).reverse!
    end

    def reverse!
      return self if empty?

      prev = @head
      swap = prev.next
      curr = prev.next

      while swap
        swap = swap.next
        curr.next = prev
        prev = curr
        curr = swap
      end

      @head, @tail = @tail, @head

      self
    end

    def each
      return enum_for(:each) unless block_given?

      each_node do |node|
        yield node.value
      end
    end

    def to_a
      each.to_a
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

    def delete(value)
      return nil if empty?
      prev, node = nil, @head

      loop do
        if node.value == value
          prev.next = node.next if prev
          @head = node.next if node == @head
          @tail = prev if node == @tail
          return value
        end

        prev, node = node, node.next
      end
    end

    private

    def each_node
      return enum_for(:each_node) unless block_given?

      node = @head
      while node
        foll = node.next
        yield node
        node = foll
      end
    end
  end

  def List(ary)
    ary.each_with_object(List.new) { |item, list| list << item }
  end
  module_function :List
end
