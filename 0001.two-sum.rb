# typed: strict
# -*- coding: utf-8 -*-
#
# @lc app=leetcode id=1 lang=ruby
#
# [1] Two Sum
#
# https://leetcode.com/problems/two-sum/description/
#
# Given an array of integers, return indices of the two numbers such
# that they add up to a specific target.
#
# You may assume that each input would have exactly one solution, and
# you may not use the same element twice.
#
# Example:
#
# Given nums = [2, 7, 11, 15], target = 9,
# Because nums[0] + nums[1] = 2 + 7 = 9,
# return [0, 1].

require 'rspec'
require 'rspec/autorun'
require 'sorbet-runtime'

extend T::Sig

sig do
  params(
    numbers: T::Array[::Numeric],
    target: ::Numeric
  ).returns(
    T::Array[::Numeric]
  )
end
def two_sum(numbers:, target:)
  previous_number_indexes = {}

  numbers.each_with_index do |x, i|
    # Which number do we need to hit the target?
    matching_number = target - x

    # If we've already encountered it we have a solution
    if previous_number_indexes.key?(matching_number)
      return [previous_number_indexes[matching_number], i]
    end

    # Otherwise store it to see if any future number
    # matches against it
    previous_number_indexes[x] = i
  end

  [-1, -1]
end

RSpec.describe 'Solution 1 - Two Sum' do
  it 'finds the two numbers which sum to a target' do
    expect(
      two_sum(numbers: [2, 7, 11, 15], target: 9)
    ).to eq([0, 1])
  end

  # More made up than anything for now, don't feel like consulting the site
  it 'returns negative numbers when nothing was found' do
    expect(
      two_sum(numbers: [2, 7, 11, 15], target: 99)
    ).to eq([-1, -1])
  end
end
