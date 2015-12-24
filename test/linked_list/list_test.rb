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
end
