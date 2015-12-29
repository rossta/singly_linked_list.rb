require "test_helper"

describe LinkedList::List do
  subject { create_list }

  let(:node_1) { create_node }
  let(:node_2) { create_node }

  describe "#initialize" do
    it "has no head" do
      subject.head.must_be_nil
    end

    it "has no tail" do
      subject.tail.must_be_nil
    end

    it "is empty" do
      subject.must_be :empty?
    end

    it "has length 0" do
      subject.length.must_equal 0
    end
  end

  describe "#push" do
    it "adds first node as head" do
      subject.push(node_1)

      subject.head.must_equal node_1
    end

    it "adds first node as tail" do
      subject.push(node_1)

      subject.tail.must_equal node_1
    end

    it "will not be empty" do
      subject.push(node_1)

      subject.wont_be :empty?
    end

    it "increases length" do
      subject.push(node_1)

      subject.length.must_equal 1

      subject.push(node_2)

      subject.length.must_equal 2
    end

    it "preserves head of list" do
      subject.push(node_1)
      subject.push(node_2)

      subject.head.must_equal node_1
    end

    it "adds node to tail of list" do
      subject.push(node_1)
      subject.push(node_2)

      subject.head.must_equal node_1
      subject.tail.must_equal node_2
    end

    it "sets references to next node" do
      subject.push(node_1)
      subject.push(node_2)

      node_1.next.must_equal node_2
    end

    it "aliases to #<<" do
      subject << node_1
      subject << node_2

      subject.head.must_equal node_1
      subject.tail.must_equal node_2
    end

    it "accepts values" do
      subject << 1
      subject << 2

      subject.first.must_equal 1
      subject.last.must_equal 2
    end

    it "forms nodes from values" do
      subject << 1
      subject << 2

      subject.head.must_be_kind_of LinkedList::Node
      subject.tail.must_be_kind_of LinkedList::Node
    end

    it "returns self" do
      list = subject.push(node_1)

      subject.must_equal list
    end
  end

  describe "#unshift" do
    it "adds first node as head" do
      subject.unshift(node_1)

      subject.head.must_equal node_1
    end

    it "adds first node as tail" do
      subject.unshift(node_1)

      subject.tail.must_equal node_1
    end

    it "will not be empty" do
      subject.unshift(node_1)

      subject.wont_be :empty?
    end

    it "increases length" do
      subject.unshift(node_1)

      subject.length.must_equal 1

      subject.unshift(node_2)

      subject.length.must_equal 2
    end

    it "preserves tail of list" do
      subject.unshift(node_1)
      subject.unshift(node_2)

      subject.tail.must_equal node_1
    end

    it "adds node to head of list" do
      subject.unshift(node_1)
      subject.unshift(node_2)

      subject.head.must_equal node_2
      subject.tail.must_equal node_1
    end

    it "sets references to next node" do
      subject.unshift(node_1)
      subject.unshift(node_2)

      node_2.next.must_equal node_1
    end

    it "accepts values" do
      subject.unshift 1
      subject.unshift 2

      subject.first.must_equal 2
      subject.last.must_equal 1
    end

    it "forms nodes from values" do
      subject.unshift 1
      subject.unshift 2

      subject.head.must_be_kind_of LinkedList::Node
      subject.tail.must_be_kind_of LinkedList::Node
    end

    it "returns self" do
      list = subject.unshift(node_1)

      subject.must_equal list
    end
  end

  describe "#pop" do
    it "returns nil" do
      subject.pop.must_be_nil
    end

    it "returns only value" do
      node_1.value = "foo"

      subject << node_1

      subject.pop.must_equal "foo"
    end

    it "returns tail value" do
      node_1.value = "foo"
      node_2.value = "bar"

      subject << node_1
      subject << node_2

      subject.pop.must_equal "bar"
    end

    it "decreases length" do
      subject << node_1
      subject << node_2

      subject.pop
      subject.length.must_equal 1

      subject.pop
      subject.length.must_equal 0
    end

    it "is empty" do
      subject << node_1
      subject.pop

      subject.must_be :empty?
    end

    it "sets tail to nil for empty" do
      subject << node_1
      subject.pop

      subject.tail.must_be_nil
    end

    it "sets head to nil for empty" do
      subject << node_1
      subject.pop

      subject.head.must_be_nil
    end
  end

  describe "#shift" do
    it "returns nil" do
      subject.shift.must_be_nil
    end

    it "returns only value" do
      node_1.value = "foo"

      subject << node_1

      subject.shift.must_equal "foo"
    end

    it "returns head value" do
      node_1.value = "foo"
      node_2.value = "bar"

      subject << node_1
      subject << node_2

      subject.shift.must_equal "foo"
    end

    it "decreases length" do
      subject << node_1
      subject << node_2

      subject.shift
      subject.length.must_equal 1

      subject.shift
      subject.length.must_equal 0
    end

    it "is empty" do
      subject << node_1
      subject.shift

      subject.must_be :empty?
    end

    it "sets tail to nil for empty" do
      subject << node_1
      subject.shift

      subject.tail.must_be_nil
    end

    it "sets head to nil for empty" do
      subject << node_1
      subject.shift

      subject.head.must_be_nil
    end
  end

  describe "#first" do
    it "returns nil" do
      subject.first.must_be_nil
    end

    it "returns value of head" do
      node_1.value = "foo"
      subject << node_1

      subject.first.must_equal "foo"

      node_2.value = "bar"
      subject << node_2

      subject.first.must_equal "foo" # unchanged
    end
  end

  describe "#last" do
    it "returns nil" do
      subject.last.must_be_nil
    end

    it "returns value of tail" do
      node_1.value = "foo"
      subject << node_1

      subject.last.must_equal "foo"

      node_2.value = "bar"
      subject << node_2

      subject.last.must_equal "bar"
    end
  end

  describe "#clear" do
    it "sets length to 0" do
      subject << node_1

      subject.clear
      subject.length.must_equal 0
    end

    it "empties" do
      subject << node_1

      subject.clear
      subject.must_be :empty?
    end

    it "sets head to nil" do
      subject << node_1
      subject.clear
      subject.head.must_be_nil
    end

    it "sets tail to nil" do
      subject << node_1
      subject.clear
      subject.tail.must_be_nil
    end

    it "aliases to reset" do
      subject << node_1
      subject.reset
      subject.head.must_be_nil
      subject.tail.must_be_nil
      subject.must_be :empty?
      subject.length.must_equal 0
    end
  end

  describe "#reverse" do
    it "reverses items in list" do
      subject << 1
      subject << 2
      subject << 3

      list = subject.reverse

      list.shift.must_equal 3
      list.shift.must_equal 2
      list.shift.must_equal 1
    end

    it "returns empty" do
      list = subject.reverse

      list.must_be :empty?
    end

    it "returns 1 item list" do
      subject << 1

      list = subject.reverse

      list.head.value.must_equal 1
      list.tail.value.must_equal 1
    end

    it "returns new list" do
      subject << 1
      list = subject.reverse
      list.object_id.wont_equal subject.object_id
    end
  end

  describe "#each" do
    it "yields each value" do
      subject << 1
      subject << 2
      subject << 3

      result = []
      subject.each { |item| result << item }

      result.must_equal [1, 2, 3]
    end

    it "is empty" do
      result = []
      subject.each { |item| result << item }

      result.must_be :empty?
    end

    it "implements Enumerable" do
      subject.must_be_kind_of Enumerable
    end

    it "returns Enumerator without block" do
      subject << 1 << 2 << 3

      enum = subject.each

      enum.map { |n| n }.must_equal [1, 2, 3]
    end
  end

  describe "#delete" do
    it "removes from head" do
      subject << 1 << 2 << 3

      subject.delete(1)

      subject.to_a.must_equal [2, 3]
    end

    it "removes from middle" do
      subject << 1 << 2 << 3

      subject.delete(2)

      subject.to_a.must_equal [1, 3]
    end

    it "removes from tail" do
      subject << 1 << 2 << 3

      subject.delete(3)

      subject.to_a.must_equal [1, 2]
    end

    it "is empty" do
      subject.delete(1) # no op

      subject.must_be :empty?
    end

    it "becomes empty" do
      subject << 1

      subject.delete(1)

      subject.must_be :empty?
    end

    it "removes first match only" do
      subject << 1 << 1

      subject.delete(1)

      subject.to_a.must_equal [1]
    end
  end
end
