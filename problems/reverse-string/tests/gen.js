const getRandomInt = (min, max) => {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min) + min);
};

const getRandomLetter = () => {
  return String.fromCharCode(getRandomInt(97, 123));
};

const generateIO = () => {
  const length = getRandomInt(0, 10);
  let input = '';
  let output = '';
  for (let i = 0; i <= length; i++) {
    const letter = getRandomLetter();
    input = input + letter;
    output = letter + output;
  }
  return { input, output };
};

const generateTests = () => {
  const fs = require('fs');

  for (let i = 0; i < 50; i++) {
    const { input, output } = generateIO();

    fs.writeFile(`${i}.in.txt`, input, (e) => {
      if (e) throw new Error('sori');
    });

    fs.writeFile(`${i}.out.txt`, output, (e) => {
      if (e) throw new Error('sori');
    });
  }
};

generateTests();
