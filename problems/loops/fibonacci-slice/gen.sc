#!/usr/bin/env scala

object Gen extends App {
  import java.io.{PrintWriter, File}
  import util.Random
  import scala.collection.mutable

  def writeFile(destination: String, content: String) = {
    val writer = new PrintWriter(new File(destination))
    writer.write(content)
    writer.close()
  }

  def padLeft(len: Int, char: Char, text: String) = Seq.fill(len - text.length)(char).mkString("") ++ text

  def clamp(low: Int, high: Int, v: Int) = Math.max(low, Math.min(high, v))

  def fibs: LazyList[Long] = 0L #:: fibs.scanLeft(1L)(_ + _)

  val used = mutable.Set[(Int, Int)]()

  for (i <- 0 to 9) {
    var done = false
    while (!done) {
      val from = Random.nextInt(50)
      val to = clamp(from, 50, Random.nextInt(50 + from))
      if (!used.contains(from -> from)) {
        done = true
        used += from -> to
        val fibSlice = fibs.slice(from, to + 1)
        val n = padLeft(3, '0', i.toString)
        writeFile(s"$n.in.txt", s"$from $to")
        writeFile(s"$n.out.txt", fibSlice.mkString("\n"))
      }
    }
  }

  writeFile("010.in.txt", "0 50")
  writeFile("010.out.txt", fibs.slice(0, 51).mkString("\n"))
}
