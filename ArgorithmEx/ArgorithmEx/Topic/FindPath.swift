//
//  FindPath.swift
//  ArgorithmEx
//
//  Created by Plum on 2021/10/26.
//

import Foundation

struct Topic12 {
    static func test() {
        Ex1.test()
    }
    
}


extension Topic12 {
    struct Ex1 {
        
        static func findPath(in array: [[Character]], value: String) {
         
            guard !array.isEmpty, !array[0].isEmpty, !value.isEmpty else {
                return
            }
            
            let row = array.count
            let column = array[0].count
            
            var pathArray = Array<Array<Bool>>(repeating: Array(repeating: false, count: column), count: row)
            
            for r in 0 ..< row {
                for c in 0 ..< column {
                    // 作为入口
                    findPath(in: array, row: r, column: c, value: value, valueIndex: value.startIndex, pathArray: &pathArray)
                }
            }
        }
        
        static func findPath(in array: [[Character]], row: Int, column: Int, value: String, valueIndex: String.Index, pathArray: inout [[Bool]]) {
            
            let r = array.count
            let c = array[0].count
            
            guard row < r, row >= 0, column >= 0, column < c, !pathArray[row][column] else {
                return
            }
            
            if array[row][column] == value[valueIndex] {
                pathArray[row][column] = true
                let nextValueIndex = value.index(after: valueIndex)
                
                if nextValueIndex == value.endIndex {
                    print(pathArray)
                } else {
                    findPath(in: array, row: row, column: column + 1, value: value, valueIndex: nextValueIndex, pathArray: &pathArray)
                    findPath(in: array, row: row + 1, column: column, value: value, valueIndex: nextValueIndex, pathArray: &pathArray)
                    findPath(in: array, row: row, column: column - 1, value: value, valueIndex: nextValueIndex, pathArray: &pathArray)
                    findPath(in: array, row: row - 1, column: column, value: value, valueIndex: nextValueIndex, pathArray: &pathArray)
                }
                pathArray[row][column] = false
            }
            
        }
        
        static func test() {
            let a = [
                "abtg".map { $0 },
                "cfcs".map { $0 },
                "jdeh".map { $0 },
            ]
            
            findPath(in: a, value: "bfce")
            print("\(self) OVER")
        }
    }
}

