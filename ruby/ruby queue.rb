require 'test/unit'

class Queue
    include Enumerable

    Node = Struct.new :element, :next

    attr_reader :head, :tail, :size

    def initialize(items = [])
        @head, @tail = nil, nil
        @size = 0

        items.to_ary.each { |element| enqueue element }
    end

    def enqueue(element)
        n = Node.new element, nil
        if @tail
            @tail.next = n
            @tail = n
        else
            @head = @tail = n
        end
        @size += 1
        element
    end

    alias_method :<<, :enqueue

    def dequeue
        return nil unless @head
        n = @head
        if @size == 1
            clear
            return n.element
        end

        @head = n.next
        @size -= 1
        n.element
    end

    def front
        @head && @head.element 
    end

    def back
        @tail && @tail.element
    end

    def empty?
        @size == 0
    end

    def clear
        @head, @tail = nil, nil
        @size = 0
    end

    def each
        return unless @head

        n = @head
        while n 
            yield n.element
            n = n.next
        end
    end
end

if __FILE__ == $0
    class TestQueue < Test::Unit::TestCase
        def setup
            @queue = Queue.new
        end

        def teardown
            @queue.clear
        end

        def test_simple
            element = 1
            @queue.enqueue element

            assert_equal element, @queue.front
            assert_equal 1, @queue.size
            assert !@queue.empty?

            assert_equal element, @queue.dequeue
            assert_equal 0, @queue.size
            assert @queue.empty?
        end
    end
end