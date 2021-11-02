process.stdout.write(
  (to_bin = (n, m = n % BigInt(2), d = n / BigInt(2)) =>
    n === 0 ? `0` : `${d > 0 ? to_bin(d) : ``}${m}`
    //n.toString(`2`)
  )(
    BigInt(String(require(`fs`).readFileSync(0)))
  )
)
