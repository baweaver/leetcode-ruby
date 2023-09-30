# -*- coding: utf-8 -*-
#
# @lc app=leetcode id=203 lang=ruby
#
# [203] Remove Linked List Elements
#
# https://leetcode.com/problems/remove-linked-list-elements/description/
#
# Remove all elements from a linked list of integers that have value val.
#
# Example:
#
# Input:  1->2->6->3->4->5->6, val = 6
# Output: 1->2->3->4->5
#
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end


# Recursive.

# @param {ListNode} head
# @param {Integer} val
# @return {ListNode}
def remove_elements_a(head, val)
  return if head.nil?
  if head.val == val
    head = remove_elements(head.next, val)
  else
    head.next = remove_elements(head.next, val)
  end
  head
end


# Iterative.

def remove_elements(head, val)
  head = head.next while !head.nil? && head.val == val
  cur = head
  while !cur.nil? && !cur.next.nil?
    if cur.next.val == val
      cur.next = cur.next.next
    else
      cur = cur.next
    end
  end
  head
end
