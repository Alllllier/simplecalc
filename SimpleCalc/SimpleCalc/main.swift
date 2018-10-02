//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        if Int(args.last!) != nil { // if the last is a number
            if args.count == 3 {
                let myOperator =  args[1]
                let num1 = Int(args[0])
                let num2 = Int(args[2])
                if (num1 != nil && num2 != nil) {
                    switch myOperator {
                    case "+":
                        return num1! + num2!
                    case "-":
                        return num1! - num2!
                    case "*":
                        return num1! * num2!
                    case "/":
                        return num1! / num2!
                    case "%":
                        return num1! % num2!
                    default:
                        return 0
                    }
                }
            }
        } else {
                let verb = args.last;
                var result =  0
                switch verb {
                case "count":
                    result = args.count - 1
                case "avg":
                    let numCount = args.count - 1
                    if numCount > 0 {
                        for index in 0...(numCount - 1) {
                            result += Int(args[index])!
                        }
                        result /= (numCount)
                    }
                case "fact":
                    if args.count == 2 {
                        result =  1
                        var myNum = Int(args[0])!
                        while myNum > 1 {
                            result *= myNum
                            myNum -= 1
                        }
                    }
                default:
                    result = 0
                }
                return result
            }
        return 0
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))
