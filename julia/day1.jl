module day1
	# part 1
	input = split(read("data/day1.txt", String))

  input_modified = map(x -> parse(Int64, x), input)

	part1 = sum(input_modified)
	println("Solution to Part 1: $part1")

	# part2
	function part2(input = input_modified)
    current = 0
    repeating_freqs = Set{Int64}([0])

    while true
      for x in input_modified
        current += x
        if current in repeating_freqs
          return(current)
        end
        push!(repeating_freqs, current)
      end
    end
  end
  part2_solution = part2()
  println("Solution to part2: $part2_solution")
end