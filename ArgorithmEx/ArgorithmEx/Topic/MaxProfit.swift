//
//  MaxProfit.swift
//  ArgorithmEx
//
//  Created by Plum on 2021/10/27.
//

import Foundation

struct Topic63 {
    static func test() {
        Ex1.test()
    }
    
}


extension Topic63 {
    struct Ex1 {
        
        static func maxProfit(in array: [Int]) -> Int {
            guard array.count > 1 else {
                return 0
            }
            
            var maxDiff = 0
            var min = array[0]
            
            for value in array {
                if value < min {
                    min = value
                } else {
                    maxDiff = max(maxDiff, value - min)
                }
            }
            
            return maxDiff
        }
        
        static func test() {
            let a = [9, 11, 8, 5, 7, 12, 16, 14, 1, 101]
            assert(maxProfit(in: a) == 100)
            
            print("\(self) OVER")
        }
    }
}

