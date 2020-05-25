const fs = require('fs');

const sieve = n => {
  const primeTable = [];
  for (let i = 0; i < n; primeTable[i++] = true);
  for (let i = 2; i * i < n; ++i)
    if (primeTable[i])
      for (let j = i * i; j <= n; j += i)
        primeTable[j] = false;

  return primeTable;
};

const table = sieve(600);

const inputs = [2, 4, 8, 10, 67, 233, 499, 396, 180, 284, 9, 3, 6];

for (const [index, x] of inputs.entries()) {
  let smaller = x;
  while (!table[smaller])
    --smaller;

  let greater = x;
  while (!table[++greater]);

  const number = `${index > 9 ? `0` : `00`}${index}`;
  fs.writeFile(`${number}.in.txt`, `${x}`, console.log);
  fs.writeFile(`${number}.out.txt`, `${greater} ${smaller}`, console.log);
}
