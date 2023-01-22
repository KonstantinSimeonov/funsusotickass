# Overcaffeinated programmer

**Tse Tso** is a chinese programmer who loves drinking coffee. In fact, he drinks so much coffee, that he gets too energetic and starts jumping to get rid of some of that energy. He can jump either **1**, **2** or **5** meters. Because he's got a lot of jumping to do, he would like to know the number of possible ways to jump to **N** meters. Here's an example:

Tse Tso wants to jump 4 meters, which can be done in the following ways
```
1m -> 1m -> 1m -> 1m
1m -> 1m -> 2m
1m -> 2m -> 1m
2m -> 1m -> 1m
2m -> 2m
```

That would be a total of **5** different ways to jump **4** meters.

For **3** meters, the total would be **3**:

```
1 -> 1 -> 1
2 -> 1
1 -> 2
```

Find in how many different ways Tse Tso can jump to meter **N**.

## Input
- A single line containing a single natural number **N**.
- 1 <= **N** <= 20000

## Output
- Output the count of the different ways on a single line.

### Hint
The solution should have a time/space complexity of at most O(N).

## Sample tests
| Input | Output |
|:------|:-------|
| 1     | 1      |
| 3     | 3      |
| 5     | 5      |
