#!/usr/bin/env ruby

# Code réalisé lords de calendrier de l'avent `advent of code` édition 2021. https://adventofcode.com/
#
# La réalisation à ce défi à été réalisé par Benjamin Courchesne le 01 décembre 2021. Les

input = File.read("./input.txt")

# --- Part One ---
def sol_day1_part_one(input = "")
  count = 0
  arr = input.split(/\n/).map(&:to_i)
  1.upto(arr.length - 1) { |i| count += 1 if arr[i-1] < arr[i]  }
  count
end

print "solution to challenge day 1, part 1: ", sol_day1_part_one(input), "\n"

# --- Part Two ---
def sol_day1_part_two(input = "")
  count = 0
  arr = input.split(/\n/).map(&:to_i)
  arr = (calc = lambda{ |n, i, r| i + 2 == n.length ? r : calc.call(n, i + 1, r << n[i..i+2].reduce(0, :+))}).call(arr, 0, [])
  old = arr[0]
  arr.drop(1).each { |x| count += 1 if old < x; old = x }
  count
end

print "solution to challenge day 1, part 2: ", sol_day1_part_two(input), "\n"
