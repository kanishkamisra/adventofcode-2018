c2 = 0
c3 = 0
strings = []
for line in open("data/day2.txt"):
  s = line.strip()
  print(s)
  strings.append(s)
  count = {}
  for c in s:
    if c not in count:
      count[c] = 0
    count[c] += 1
  two = False
  three = False
  for k, v in count.items():
    if v == 2:
      two = True
    if v == 3:
      three = True

  if two:
    c2 += 1
  if three:
    c3 += 1

print(c2 * c3)

for s1 in strings:
  for s2 in strings:
    diff = 0
    for i in range(len(s1)):
      if s1[i] != s2[i]:
        diff += 1
    if diff == 1:
      final = []
      for i in range(len(s1)):
        if s1[i] == s2[i]:
          final.append(s1[i])
      print(''.join(final)) 
      print(s1, s2)