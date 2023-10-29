# typed: strict
# -*- coding: utf-8 -*-
#
# @lc app=leetcode id=2 lang=ruby
#
# [2] Add Two Numbers
#
# https://leetcode.com/problems/add-two-numbers/description/
#
# You are given two non-empty linked lists representing two
# non-negative integers. The digits are stored in reverse order and
# each of their nodes contain a single digit. Add the two numbers and
# return it as a linked list.
#
# You may assume the two numbers do not contain any leading zero,
# except the number 0 itself.
#
# Example:
#
# Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8
# Explanation: 342 + 465 = 807.

require 'rspec'
require 'rspec/autorun'
require 'sorbet-runtime'

extend T::Sig

ListNode = Struct.new(:value, :next) do
  def self.from_int(n)
    n.digits.reverse.reduce(nil) { |list, digit| ListNode[digit, list] }
  end

  def self.empty
    ListNode[nil, nil]
  end
end

sig do
  params(
    list_one: ListNode,
    list_two: ListNode
  ).returns(ListNode)
end
def add_two_numbers(list_one, list_two)
  current_node = ListNode.empty
  answer = current_node
  carry = 0

  while list_one || list_two || carry.positive?
    sum = carry + list_one&.value.to_i + list_two&.value.to_i
    carry = sum / 10

    current_node.next = ListNode[sum % 10]
    current_node = current_node.next

    list_one &&= list_one.next
    list_two &&= list_two.next
  end

  answer.next
end

# Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8
# Explanation: 342 + 465 = 807.

RSpec.describe 'Solution 2 - Add Two Numbers' do
  it 'sums two linked lists into another linked list' do
    list_one = ListNode.from_int(342)
    list_two = ListNode.from_int(465)

    expect(add_two_numbers(list_one, list_two)).to eq(ListNode.from_int(807))
  end
end
