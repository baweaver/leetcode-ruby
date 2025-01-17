# typed: true
# -*- coding: utf-8 -*-
#
# @lc app=leetcode id=256 lang=ruby
#
# [256] Paint House
#
# https://leetcode.com/problems/paint-house/description/
#
# There are a row of n houses, each house can be painted with one of
# the three colors: red, blue or green. The cost of painting each
# house with a certain color is different. You have to paint all the
# houses such that no two adjacent houses have the same color.

# The cost of painting each house with a certain color is represented
# by a n x 3 cost matrix. For example, costs[0][0] is the cost of
# painting house 0 with color red; costs[1][2] is the cost of painting
# house 1 with color green, and so on... Find the minimum cost to
# paint all houses.
#
# Note:
# All costs are positive integers.
#
# Example:
#
# Input: [[17,2,17],[16,16,5],[14,3,19]]
# Output: 10


# DP

def min_cost(costs)
  return 0 if costs.nil? || costs.empty?
  dp = Array.new(costs.size) { Array.new(3, 0) }
  dp[0] = costs[0]
  (1..costs.size-1).each do |i|
    dp[i][0] = [dp[i-1][1], dp[i-1][2]].min + costs[i][0]
    dp[i][1] = [dp[i-1][0], dp[i-1][2]].min + costs[i][1]
    dp[i][2] = [dp[i-1][0], dp[i-1][1]].min + costs[i][2]
  end
  dp[costs.size-1].min
end
