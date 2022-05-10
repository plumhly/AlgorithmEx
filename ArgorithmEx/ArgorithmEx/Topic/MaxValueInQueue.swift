//
//  MaxValueInQueue.swift
//  ArgorithmEx
//
//  Created by Plum on 2021/10/27.
//

import Foundation

struct Topic59 {
    static func test() {
        Ex1.test()
    }
    
}


extension Topic59 {
    struct Ex1 {
        
        static func maxValueInQueue(_ array: [Int], queueSize: Int) {
            guard array.count >= queueSize, queueSize > 0 else {
                return
            }
            
            var queue = Queue<Int>()
            
            var maxInex = 0
            for index in 0 ..< queueSize {
                if array[index] > array[maxInex] {
                    maxInex = index
                }
            }
            
            queue.enqueue(value: maxInex)
            
            var result: [Int] = [array[maxInex]]
            
            for index in queueSize ..< array.count {
                if let head = queue.head {
                    if index - head >= queueSize {
                        queue.dequeue()
                    }
                }
                
                if let tail = queue.tail {
                    if array[tail] >= array[index] {
                        queue.enqueue(value: index)
                    } else {
                        while let tail = queue.tail, array[tail] < array[index] {
                            queue.dequeueTail()
                        }
                        queue.enqueue(value: index)
                    }
                } else {
                    queue.enqueue(value: index)
                }
                
                result.append(array[queue.head!])
            }
            
            print(result)
        }
        
        static func test() {
            
            let a = [2, 3, 4, 2, 6, 2, 5, 1]
            maxValueInQueue(a, queueSize: 3)
            print("\(self) OVER")
        }
    }
}

