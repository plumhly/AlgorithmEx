//
//  ReversePair.swift
//  ArgorithmEx
//
//  Created by Plum on 2021/10/27.
//

import Foundation
struct Topic51 {
    static func test() {
        Ex1.test()
    }
    
}


extension Topic51 {
    struct Ex1 {
        
        static func findInversePair(in array: [Int]) -> Int {
            var array = array
            var copyData = array
            
            return findInversePair(in: &array, copyArray: &copyData, start: 0, end: array.count - 1)
        }
        
        private static func findInversePair(in array: inout [Int], copyArray: inout [Int], start: Int, end: Int) -> Int {
            
            guard start < end else {
                return 0
            }
            
            let middleIndex = (start + end) >> 1
            
            let leftInversePairCount = findInversePair(in: &copyArray, copyArray: &array, start: start, end: middleIndex)
            let rightInversePairCount = findInversePair(in: &copyArray, copyArray: &array, start: middleIndex + 1, end: end)
            
            var leftEndIndex = middleIndex
            var rightEndIndex = end
            
            var index = end
            
            var count = 0
            
            while leftEndIndex >= start, rightEndIndex >= middleIndex + 1 {
                if array[leftEndIndex] > array[rightEndIndex] {
                    copyArray[index] = array[leftEndIndex]
                    index -= 1
                    leftEndIndex -= 1
                    count += rightEndIndex - middleIndex
                } else {
                    copyArray[index] = array[rightEndIndex]
                    index -= 1
                    rightEndIndex -= 1
                }
            }
            
            // 如果前半部分还有元素
            while leftEndIndex >= start {
                copyArray[index] = array[leftEndIndex]
                index -= 1
                leftEndIndex -= 1
            }
            
            // 如果后半部分还有元素
            while rightEndIndex >= middleIndex + 1 {
                copyArray[index] = array[rightEndIndex]
                index -= 1
                rightEndIndex -= 1
            }
            
            return leftInversePairCount + rightInversePairCount + count
        }
        
        static func test() {
            
            assert(findInversePair(in: [7, 5, 6 ,4]) == 5)
            
            print("\(self) OVER")
        }
    }
}

