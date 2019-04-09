# fib

CLI executable for **Raspberry Pi** that calculates **fibonacci** iterations out
to **ridiculous** depths.

✓ It uses ***"infinite integers"*** that enable sums of **astronomical numbers**.

✓ It uses **asynchronous looping** so that it can be implemented in a
  **recursive** style **without stack limitations**.

Given that the max iteration variable is limited to unsigned int, and
assuming we can run it on a 64-bit platform, we should top out at a max
depth of ***9,223,372,036,854,775,807*** !!!

🤯

Unfortunately, the Raspberry Pi, equipped with its limited memory capacity and
my inefficient adding routine, has no hopes of ever reaching that number.

🤕

Regardless, I don't have an IBM system Z at home, and the Pi can still do several
thousand iterations relatively quickly. Good enough for my personal fibonacci needs.

🧐

<br />

---

This project builds, tests, and runs on
[Raspbian](https://www.raspberrypi.org/documentation/raspbian/) Linux
using [Swift 5.0](https://swift.org/).
It has package dependencies on
[QLoop](https://github.com/quickthyme/qloop)
and [UIntfinity](https://github.com/quickthyme/UIntfinity).
