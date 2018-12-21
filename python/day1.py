lines = [int(x.strip()) for x in open("data/day1.txt")]

def part1(lines = lines):
  return(sum(lines))

def part2(lines = lines):
  repeating = set([0])
  current = 0
  while 1:
    for x in lines:
      current += x
      # print(current)
      # print(repeating)
      if current in repeating:
        return(current)
      else:
        repeating.add(current)

print(part1(lines))
print(part2(lines))
  
