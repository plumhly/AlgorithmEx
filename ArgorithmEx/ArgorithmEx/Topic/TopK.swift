//
//  TopK.swift
//  ArgorithmEx
//
//  Created by Plum on 2021/10/26.
//

import Foundation

struct TopicN {
    static func test() {
        Ex1.test()
    }
    
}


extension TopicN {
    struct Ex1 {
        
        struct MaxHeap {
            var data: [Int] = []
            
            var lastIndex: Int {
                return data.count - 1
            }
            
            var top: Int? {
                return data.first
            }

            mutating
            func input(value: Int) {
                data.append(value)
                heapfy()
            }
            
            mutating
            private func heapfy() {
                let lastParentNode = (lastIndex - 1) / 2
                
                for index in stride(from: lastParentNode, through: 0, by: -1) {
                    sink(at: index)
                }
            }
            
            
            mutating
            private func sink(at index: Int) {
                let maxIndex = swapValueIfNeeded(at: index)
                if maxIndex != index {
                    sink(at: maxIndex)
                }
            }
            
            mutating
            private func swapValueIfNeeded(at index: Int) -> Int {
                let leftChildIndex = index * 2 + 1
                let rightChildIndex = index * 2 + 2
                
                var maxIndex = index
                if leftChildIndex <= lastIndex, data[leftChildIndex] > data[maxIndex] {
                    maxIndex = leftChildIndex
                }
                
                if rightChildIndex <= lastIndex, data[rightChildIndex] > data[maxIndex] {
                    maxIndex = rightChildIndex
                }
                
                if maxIndex != index {
                    data.swapAt(index, maxIndex)
                }
                
                return maxIndex
            }
        }
        
        static func test() {
            
            var maxHeap = MaxHeap()
            maxHeap.input(value: 1)
            assert(maxHeap.top == 1)
            maxHeap.input(value: 2)  
            assert(maxHeap.top == 2)
            maxHeap.input(value: 3)
            assert(maxHeap.top == 3)
            maxHeap.input(value: 4)
            assert(maxHeap.top == 4)
            
            maxHeap.input(value: 8)
            assert(maxHeap.top == 8)
            
            maxHeap.input(value: 4)
            assert(maxHeap.top == 8)
            
            print("\(self) OVER")
        }
    }
}

