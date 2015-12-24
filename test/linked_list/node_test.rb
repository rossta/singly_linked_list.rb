require "test_helper"

describe LinkedList::Node do
  subject { create_node }

  describe "#value" do
    it "is nil" do
      subject.value.must_be_nil
    end

    it "is present" do
      subject.value = "foobar"
      subject.value.must_equal "foobar"
    end
  end

  describe "#next" do
    it "is nil" do
      subject.next.must_be_nil
    end

    it "is another node" do
      node_2 = LinkedList::Node.new
      subject.next = node_2

      subject.next.must_equal node_2
    end
  end

  describe "#initialize" do
    it "accepts a value" do
      node = LinkedList::Node.new("foobar")
      node.value.must_equal "foobar"
    end

    it "accepts a value and next" do
      node = LinkedList::Node.new(nil, :next)
      node.next.must_equal :next
    end

    it "accepts nothing" do
      node = LinkedList::Node.new
      node.value.must_be_nil
    end
  end
end
