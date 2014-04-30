#!/usr/bin/env ruby

require "rbtree"

class Stack
  def initialize
    @elements = []
    @elements_rb = RBTree.new
  end

  def getLargest
    return nil if @elements.empty?
    @elements_rb.last[0]
  end

  def add(element)
    @elements << element
    @elements_rb[element] = 0 if @elements_rb[element].nil?
    @elements_rb[element] += 1
    nil
  end

  def pop
    return nil if @elements.empty?
    element = @elements.delete_at(-1)
    @elements_rb[element] -= 1
    @elements_rb.delete(element) if @elements_rb[element] == 0
    element
  end
end
