module day1
	# part 1
	input = split(read("data/day1.txt", String))

	part1 = sum(map(x -> parse(Int64, x), input))
	println("Solution to Part 1: $part1")

	# part2
	current = 0
	repeating_freqs = Set([current])
end