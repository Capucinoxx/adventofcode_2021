#!/usr/bin/env ruby

# Code réalisé lors de calendrier de l'avent `advent of code` édition 2021. https://adventofcode.com/
#
# La réalisation de ce défi a été réalisé par Benjamin Courchesne le 02 décembre 2021.

input = File.read("./input.txt")

# --- Part One ---
def sol_day2_part_one(input = "")
  pos = { "forward" => 0, "up" => 0, "down" => 0 }
  input.split(/ |\n/).each_slice(2) { |k, v| pos[k] += v.to_i }
  pos["forward"] * (pos["down"] - pos["up"])
end

print "solution to challenge day 2, part 1: ", sol_day2_part_one(input), "\n"

# --- Part Two ---
def sol_day2_part_two(input = "")
  pos = { "forward" => 0, "up" => 0, "down" => 0 }
  aim = 0
  input.split(/ |\n/).each_slice(2) do |k, v|
    pos[k] += v.to_i; aim += if k[0] == "f" then v.to_i * (pos["down"] - pos["up"]) else 0 end
  end
  aim * pos["forward"]
end

print "solution to challenge day 2, part 2: ", sol_day2_part_two(input), "\n"
