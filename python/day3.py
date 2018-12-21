# #1349 @ 869,323: 14x21

from collections import defaultdict

C = defaultdict(int)

for line in open("data/day3.txt"):
  s = line.split()
  # print(s[0])
  x, y = s[2].split(',')
  x, y = int(x), int(y[:-1])
  # print(s[3])
  r, c = s[3].split('x')
  r, c = int(r), int(c)
  # overlap = False
  for r_i in range(r):
    for c_j in range(c):
      C[(x+r_i, y+c_j)] += 1

counter = 0
for (r, c), v in C.items():
  if v > 1:
    counter += 1

print(counter)

for line in open("data/day3.txt"):
  s = line.split()
  # print(s[0])
  x, y = s[2].split(',')
  x, y = int(x), int(y[:-1])
  # print(s[3])
  r, c = s[3].split('x')
  r, c = int(r), int(c)
  overlap = False
  for r_i in range(r):
    for c_j in range(c):
      if C[(x+r_i, y+c_j)] > 1:
        overlap = True
  if not overlap:
    print(s[0][1:])

