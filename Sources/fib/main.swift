
import QLoop
import UIntfinity
import Foundation

func fibonacciLoop(_ iterations: Int) -> QLoop<(UInf, UInf), (UInf, UInf)> {
    let loop = QLoop<(UInf, UInf), (UInf, UInf)>(
        iterator: QLoopIteratorContinueOutputMax(iterations),
        onFinal: ({ print("\($0!.0)"); exit(0) }))

    loop.bind(segment:
        QLss("fibonacci",
             ({ let (cur, pre) = $0!
                $1( (cur + pre, cur) ) })))

    return loop
}

let args = CommandLine.arguments
guard
    (args.count > 1),
    let iterations = Int(args[1]),
    (iterations > 0)
    else { print("0"); exit(0) }

let fib = fibonacciLoop(iterations - 1)
fib.perform((UInf(1), UInf(0)))

RunLoop.main.run()

