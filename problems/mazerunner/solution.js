console.log(
  require(`fs`).readFileSync(0).toString(`utf8`).trim().split(`\n`).slice(1).map(x =>
    ({
        [-1]: `left`,
        0: `straight`,
        1: `right`
    }[
      Math.sign(
        [...x].reduce(
          (m, c) => c % 2
            ? m + +c
            : m - c,
          0
        )
      )
    ])
  ).join(`\n`)
);
