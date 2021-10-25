//
//  PrintNodeFromTailToHead.swift
//  ArgorithmEx
//
//  Created by Plum on 2021/10/25.
//

import Foundation

class Node<T> {
    var value: T
    var next: Node<T>?
    
    init(value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
    
}

struct Topic6 {
    static func test() {
        Ex1.test()
    }
}

extension Topic6 {
    struct Ex1 {
        private static func printNode(_ node: Node<Int>?) {
            guard let node = node else {
                return
            }
            
            if let next = node.next {
                printNode(next)
            }
            
            print(node.value)
        }
        
        static func test() {
            let a = Node(value: 1, next: Node(value: 2, next: Node(value: 3, next: nil)))
            printNode(a)
        }
    }

}
