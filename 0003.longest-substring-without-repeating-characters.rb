# typed: false
# -*- coding: utf-8 -*-
#
# @lc app=leetcode id=3 lang=ruby
#
# [3] Longest Substring Without Repeating Characters
#
# https://leetcode.com/problems/longest-substring-without-repeating-characters/description/
#
# Given a string, find the length of the longest substring without
# repeating characters.
#
# Example 1:
#
# Input: "abcabcbb"
# Output: 3
# Explanation: The answer is "abc", with the length of 3.
#
# Example 2:
#
# Input: "bbbbb"
# Output: 1
# Explanation: The answer is "b", with the length of 1.
#
# Example 3:
#
# Input: "pwwkew"
# Output: 3
# Explanation: The answer is "wke", with the length of 3. ⁠ Note that
# the answer must be a substring, "pwke" is a subsequence and not a
# substring.


# The key is to keep a sliding window of substring without repeating
# characters. Example:
#
# given "abcab"
#  a b c a b | "a"      | 1 | { a: 0 }
# / \
#i   j
#  a b c a b | "ab"     | 2 | { a: 0, b: 1 }
#  | |
#  j i
#  a b c a b | "abc"    | 3 | { a: 0, b: 1, c: 2 }
#  |   |
#  j   i
#  a b c a b | "bac"    | 3 | { a: 3, b: 1, c: 2 }
#    |   |
#    j   i
#  a b c a b | "cab"    | 3 | { a: 3, b: 4, c: 2 }
#      |   |
#      j   i
#
# max: 3

require 'rspec'
require 'rspec/autorun'
require 'sorbet-runtime'

extend T::Sig

sig { params(string: String).returns(Numeric) }
def length_of_longest_substring(string)
  last_seen_position = Hash.new(0)

  result = 0
  following_cursor = 0

  string.chars.each_with_index do |char, lead_cursor|
    if last_seen_position.key?(char)
      following_cursor = [last_seen_position[char] + 1, following_cursor].max
    end

    result = [lead_cursor - following_cursor + 1, result].max
    last_seen_position[char] = lead_cursor
  end

  result
end

RSpec.describe 'Solution 3 - Longest Substring Without Repeating Characters' do
  it 'works with the example 1' do
    expect(length_of_longest_substring("abcabcbb")).to eq(3)
  end

  it 'works with the example 2' do
    expect(length_of_longest_substring("bbbbb")).to eq(1)
  end

  it 'works with the example 3' do
    expect(length_of_longest_substring("pwwkew")).to eq(3)
  end
end
