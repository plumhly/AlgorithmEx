//
//  DoubleStackToQueue.swift
//  ArgorithmEx
//
//  Created by Plum on 2021/10/25.
//

import Foundation

struct Topic9 {
    static func test() {
        Ex1.test()
    }
}

struct Stack<T> {
    var data: [T] = []
    
    mutating
    func pop() -> T? {
        guard !data.isEmpty else {
            return nil
        }
        
        return data.removeLast()
    }
    
    mutating
    func push(value: T) {
        data.append(value)
    }
    
    var isEmpty: Bool {
        return data.isEmpty
    }
    
    mutating
    func empty() {
        data.removeAll()
    }
}

extension Topic9 {
    struct Ex1 {
        struct Queue {
            var stack1 = Stack<Int>()
            var stack2 = Stack<Int>()
            
            mutating
            func enqueue(value: Int) {
                stack1.push(value: value)
            }
            
            mutating
            func dequeue() -> Int? {
                if stack2.isEmpty {
                    for _ in 0 ..< stack1.data.count {
                        stack2.push(value: stack1.pop()!)
                    }
                    
                }
                
                return stack2.pop()
            }
        }
        
        static func test() {
            var queue = Queue()
            queue.enqueue(value: 1)
            queue.enqueue(value: 2)
            
            assert(queue.dequeue() == 1)
            
            queue.enqueue(value: 3)
            assert(queue.dequeue() == 2)
            assert(queue.dequeue() == 3)
            print("\(self) over")
        }
    }
}
