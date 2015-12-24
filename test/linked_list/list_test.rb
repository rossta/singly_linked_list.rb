require "test_helper"

describe LinkedList::List do
  subject { create_list }

  describe "#initialize" do
    it "has empty state" do
      subject.must_be :empty?
      subject.length.must_equal 0
      subject.head.must_be_nil
    end
  end

  describe "#push" do
    it "adds node as head" do
      node = create_node

      subject.push(node)

      subject.wont_be :empty?
      subject.head.must_equal node
      subject.length.must_equal 1
    end

    it "adds node to end of list" do
      node_1 = create_node
      node_2 = create_node

      subject.push(node_1)
      subject.push(node_2)

      subject.wont_be :empty?
      subject.head.must_equal node_1
      subject.tail.must_equal node_2
      subject.length.must_equal 2
    end

    it "aliases to #<<" do
      node_1 = create_node
      node_2 = create_node

      subject << node_1
      subject << node_2

      subject.wont_be :empty?
      subject.head.must_equal node_1
      subject.tail.must_equal node_2
      subject.length.must_equal 2
    end
  end
end
