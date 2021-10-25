//
//  FindValueInDoubleArray.swift
//  ArgorithmEx
//
//  Created by Plum on 2021/10/25.
//

import Foundation

struct Topic4 {
    static func test() {
        Ex1.test()
    }
}

extension Topic4 {
    struct Ex1 {
        private static func findVlalue(in array: [[Int]], value: Int) -> Bool {
            guard !array.isEmpty && validate(array: array) else {
                return false
            }
            
            var rowIndex = 0
            var columnIndex = array[0].count - 1
            var isFind = false
            
            while rowIndex < array.count, columnIndex >= 0 {
                let currentValue = array[rowIndex][columnIndex]
                if value < currentValue {
                    columnIndex -= 1
                } else if value > currentValue {
                    rowIndex += 1
                } else {
                    isFind = true
                    break
                }
            }
            
            return isFind
        }
        
       private static func validate(array: [[Int]]) -> Bool {
            return true
        }
        
        static func test() {
            let array = [
                [1, 2, 8, 9],
                [2, 4, 9, 12],
                [4, 7, 10, 13],
                [6, 8, 11, 14]
            ]
            assert(findVlalue(in: array, value: 8) == true)
            
            print("\(self) OVER")
        }
    }
}
