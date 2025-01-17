# typed: true
# -*- coding: utf-8 -*-
#
# @lc app=leetcode id=1038 lang=ruby
#
# [1038] Binary Search Tree to Greater Sum Tree
#
# https://leetcode.com/problems/binary-search-tree-to-greater-sum-tree/description/
#
# Given the root of a binary search tree with distinct values, modify
# it so that every node has a new value equal to the sum of the values
# of the original tree that are greater than or equal to node.val.
#
# Example 1:
#
# Input: [4,1,6,0,2,5,7,null,null,null,3,null,null,null,8]
# Output: [30,36,21,36,35,26,15,null,null,null,33,null,null,null,8]
#
# Note:
#
# The number of nodes in the tree is between 1 and 100.
# Each node will have value between 0 and 100.
# The given tree is a binary search tree.
#
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end


# Inorder traversal.

# @param {TreeNode} root
# @return {TreeNode}
def bst_to_gst(root, sum=[0])
  return if root.nil?
  bst_to_gst(root.right, sum)
  sum[0] += root.val
  root.val = sum[0]
  bst_to_gst(root.left, sum)
  root
end
