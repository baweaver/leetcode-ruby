# typed: strict
# -*- coding: utf-8 -*-
#
# @lc app=leetcode id=151 lang=ruby
#
# [151] Reverse Words in a String
#
# https://leetcode.com/problems/reverse-words-in-a-string/description/
#
# Given an input string, reverse the string word by word.
#
# Example 1:
#
# Input: "the sky is blue"
# Output: "blue is sky the"
#
# Example 2:
#
#
# Input: "  hello world!  "
# Output: "world! hello"
# Explanation: Your reversed string should not contain leading or
# trailing spaces.
#
# Example 3:
#
# Input: "a good   example"
# Output: "example good a"
# Explanation: You need to reduce multiple spaces between two words to
# a single space in the reversed string.
#
# Note:
#
# A word is defined as a sequence of non-space characters. Input
# string may contain leading or trailing spaces. However, your
# reversed string should not contain leading or trailing spaces. You
# need to reduce multiple spaces between two words to a single space
# in the reversed string.


# @param {String} s
# @return {String}
def reverse_words(s)
  s.split.reverse.join(' ')
end
