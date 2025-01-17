# typed: true
# -*- coding: utf-8 -*-
#
# @lc app=leetcode id=509 lang=ruby
#
# [509] Fibonacci Number
#
# https://leetcode.com/problems/fibonacci-number/description/
#
# The Fibonacci numbers, commonly denoted F(n) form a sequence, called
# the Fibonacci sequence, such that each number is the sum of the two
# preceding ones, starting from 0 and 1. That is,
#
# F(0) = 0,   F(1) = 1
# F(N) = F(N - 1) + F(N - 2), for N > 1.
#
# Given N, calculate F(N).
#
# Example 1:
#
# Input: 2
# Output: 1
# Explanation: F(2) = F(1) + F(0) = 1 + 0 = 1.
#
# Example 2:
#
# Input: 3
# Output: 2
# Explanation: F(3) = F(2) + F(1) = 1 + 1 = 2.
#
# Example 3:
#
# Input: 4
# Output: 3
# Explanation: F(4) = F(3) + F(2) = 2 + 1 = 3.
#
# Note:
#
# 0 ≤ N ≤ 30.


# Ruby magic.

# @param {Integer} n
# @return {Integer}
def fib(n)
  Hash.new { |h, k| h[k] = h[k-1] + h[k-2] }.merge({0=>0, 1=>1})[n]
end


# O(1) space.

def fib_a(n)
  d2, d1 = 0, 1
  n.times do
    d2, d1 = d1, d2+d1
  end
  d2
end
