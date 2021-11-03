process.stdout.write(
  String(BigInt(`0b${require(`fs`).readFileSync(0)}`))
)
