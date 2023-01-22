const fs = require(`fs`)

const solve = n => {
  const xs = [1, 2, 5];

  const answers = Array.from({ length: n + 5 }, () => BigInt(0))
  answers[0] = BigInt(1);
  for (let i = 0; i < n; ++i) {
    for (const j of xs) {
      answers[i + j] += answers[i]
    }
  }

  return answers[n]
}

const tests = [
  ...Array.from({ length: 10 }, (_, i) => i + 1),
  ...Array.from({ length: 5 }, (_, i) => 50 * (i + 1)),
  1000,
  1001,
  1002,
  1008,
  1109,
  10_007,
  12_006,
  19_123,
  20_000
]

tests.forEach((t, i) => {
  const num = String(i).padStart(3, `0`)
  fs.writeFileSync(`${num}.in.txt`, String(t))
  fs.writeFileSync(`${num}.out.txt`, String(solve(t)))
})
