//
//  PrintTree.swift
//  ArgorithmEx
//
//  Created by Plum on 2021/10/26.
//

import Foundation

struct Queue<T> {
    var data: [T] = []
    
    var isEmpty: Bool {
        return data.isEmpty
    }
    
    mutating
    func enqueue(value: T) {
        data.append(value)
    }
    
    @discardableResult
    mutating
    func dequeue() -> T? {
       return data.removeFirst()
    }
    
    var head: T? {
        return data.first
    }
    
    var tail: T? {
        return data.last
    }
    
    @discardableResult
    mutating
    func dequeueTail() -> T? {
        return data.removeLast()
    }
}

struct Topic32 {
    static func test() {
        Ex1.test()
    }
    
}


extension Topic32 {
    struct Ex1 {
        
        static func printTree(_ tree: Tree) {
            var queue = Queue<Tree>()
            queue.enqueue(value: tree)
            
            var result = ""
            var levelCount = 1
            var tempCount = 0
            while !queue.isEmpty {
                levelCount -= 1
                if let value = queue.dequeue() {
                    result += "\(value.value)"
                    if let left = value.left {
                        queue.enqueue(value: left)
                        tempCount += 1
                    }
                    
                    if let right = value.right {
                        queue.enqueue(value: right)
                        tempCount += 1
                    }
                }
                
                if levelCount == 0 {
                    levelCount = tempCount
                    result += "\n"
                    tempCount = 0
                }
            }
            
            print(result)
        }
        
        static func test() {
            let tree1 = Tree(value: 1, left: Tree(value: 2, left: Tree(value: 4), right: Tree(value: 5)), right: Tree(value: 3, left: Tree(value: 6)))
            
            printTree(tree1)
            
            print("\(self) OVER")
        }
    }
}

