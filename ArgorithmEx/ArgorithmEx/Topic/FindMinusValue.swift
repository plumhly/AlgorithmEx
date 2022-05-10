//
//  FindMinusValue.swift
//  ArgorithmEx
//
//  Created by Plum on 2021/10/25.
//

import Foundation

struct Topic11 {
    static func test() {
        Ex1.test()
    }
    
}


extension Topic11 {
    struct Ex1 {
        
        static func findMinusValue(in rotateArray: [Int]) -> Int? {
            guard !rotateArray.isEmpty else {
                return nil
            }
            return findMinusValue(in: rotateArray, start: 0, end: rotateArray.count - 1)
        }
        
        static func findMinusValue(in rotateArray: [Int], start: Int, end: Int) -> Int? {
            guard start <= end else {
                return nil
            }
            
            let middleIndex = (start + end) >> 1
            let middleValue = rotateArray[middleIndex]
            
            let startValue = rotateArray[start]
            let endValue = rotateArray[end]
            
            if middleValue == end, startValue == endValue {
                return rotateArray.min()
            } else {
             
                if middleValue >= startValue {
                    // 最小值在右边
                    let nextIndex = middleIndex + 1
                    if nextIndex < rotateArray.count, rotateArray[nextIndex] < middleValue {
                        return rotateArray[nextIndex]
                    }
                    
                    return findMinusValue(in: rotateArray, start: nextIndex, end: end)
                } else {
                    // 最小值在左边
                    
                    let preIndex = middleIndex - 1
                    if preIndex >= 0, rotateArray[preIndex] > middleValue {
                        return rotateArray[preIndex]
                    }
                    
                    return findMinusValue(in: rotateArray, start: start, end: preIndex)
                }
            }
        }
        
        static func test() {
            
            let a = [3, 4, 5, 1, 2]
            assert(findMinusValue(in: a) == 1)
            
            let b = [5, 1, 2, 3, 4]
            assert(findMinusValue(in: b) == 1)
            
            let c = [1, 1, 1, 2, 1]
            assert(findMinusValue(in: c) == 1)
            
            let d = [4, 5, 6,  1, 2, 3]
            assert(findMinusValue(in: d) == 1)
            
            print("\(self) OVER")
        }
    }
}
