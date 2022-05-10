//
//  CutRope.swift
//  ArgorithmEx
//
//  Created by Plum on 2021/10/26.
//

import Foundation
struct Topic14 {
    static func test() {
        Ex1.test()
        Ex2.test()
    }
    
}


extension Topic14 {
    struct Ex1 {
        
        static func cutRope(length: Int) -> Int {
            if length < 2 {
                return 0
            }
            
            if length < 4 {
                return length - 1
            }
            
            var result = Array<Int>(repeating: 0, count: length + 1)
            
            result[1] = 1
            result[2] = 2
            result[3] = 3
            
            for l in 4 ... length {
                var max = 0
                for i in 1 ... l / 2 {
                    let value = result[i] * result[l - i]
                    if value > max {
                        max = value
                    }
                }
                result[l] = max
            }
            
            return result[length]
        }
        
        static func test() {
            assert(cutRope(length: 0) == 0)
            assert(cutRope(length: 1) == 0)
            assert(cutRope(length: 2) == 1)
            assert(cutRope(length: 3) == 2)
            assert(cutRope(length: 7) == 12)
            print("\(self) OVER")
        }
    }
    
    struct Ex2 {
        
        static func cutRope(length: Int) -> Int {
            if length < 2 {
                return 0
            }
            
            if length < 4 {
                return length - 1
            }
            
            var countOfTree = length / 3
            if length % 3 == 1 {
                countOfTree -= 1
            }
            
            let countOfTwo = (length - countOfTree * 3) / 2
            
            return Int(pow(Double(3), Double(countOfTree)) * pow(Double(2), Double(countOfTwo)))
        }
        
        static func test() {
            assert(cutRope(length: 0) == 0)
            assert(cutRope(length: 1) == 0)
            assert(cutRope(length: 2) == 1)
            assert(cutRope(length: 3) == 2)
            assert(cutRope(length: 7) == 12)
            
            print("\(self) OVER")
        }
    }
}

