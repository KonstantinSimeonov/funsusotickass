You are given an array of numbers.

You task is to group the numbers by remainder of 3.

*Example*:
```
arr = {1, 2, 3, 4, 5, 6, 7}
groups:
0 -> 3, 6
1 -> 1, 4, 7
2 -> 2, 5
```

# Input

Read from the standard input

- On the single line, read the numbers of the array
  - Separated by a whitespace

# Output

Print on the standard output

- On the first line, print the group with remainder 0
- On the second line, print the group with remainder 1
- On the third line, print the group with remainder 2
- On each line, the numbers in a group are separated with a single whitespace

# Sample tests

## Input

```
1 2 3 4 5 6 7
```

## Output

```
3 6
1 4 7
2 5
```

## Input

```
3 3 3 3 3
```

## Output

```
3 3 3 3 3
// empty line for group with remainder 1
// empty line for group with remainder 2
```

