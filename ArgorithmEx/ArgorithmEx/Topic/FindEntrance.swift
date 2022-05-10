//
//  FindEntrance.swift
//  ArgorithmEx
//
//  Created by Plum on 2021/10/26.
//

import Foundation

struct Topic23 {
    static func test() {
        Ex1.test()
    }
    
}


extension Topic23 {
    struct Ex1 {
        
        static func findEntrance(in list: Node<Int>) -> Int? {
            guard let node = isContainCirecle(in: list) else {
                return nil
            }
            
            let count = findNodeCountInCircleList(item: node)
            
            var slowPointer: Node<Int>? = list
            var fastPointer: Node<Int>? = list
            for _ in 0 ..< count {
                fastPointer = fastPointer?.next
            }
            
            while slowPointer != fastPointer {
                slowPointer = slowPointer?.next
                fastPointer = fastPointer?.next
            }
            
            return slowPointer?.value
        }
        
        private static func isContainCirecle(in list: Node<Int>) -> Node<Int>? {
            
            var slowPointer: Node<Int>? = list
            var fastPointer = list.next
            
            while fastPointer != nil, slowPointer != fastPointer {
                slowPointer = slowPointer?.next
                fastPointer = fastPointer?.next?.next
            }
            
            return slowPointer == fastPointer ? slowPointer : nil
        }
        
        private static func findNodeCountInCircleList(item: Node<Int>) -> Int {
            var tempItem = item.next
            var count = 1
            while tempItem != item {
                count += 1
                tempItem = tempItem?.next
            }
            
            return count
        }
        
        static func test() {
            
            let node1 = Node(value: 1)
            let node2 = Node(value: 2)
            let node3 = Node(value: 3)
            let node4 = Node(value: 4)
            let node5 = Node(value: 5)
            let node6 = Node(value: 6)
            let node7 = Node(value: 7)
            let node8 = Node(value: 8)
            
            node1.next = node2
            node2.next = node3
            node3.next = node4
            node4.next = node5
            node5.next = node6
            node6.next = node7
            node7.next = node8
            
            node8.next = node3
            
            assert(findEntrance(in: node1) == 3)
            
            let nodeA = Node(value: 1, next: Node(value: 2, next: nil))
            assert(findEntrance(in: nodeA) == nil)
            
            let nodeB = Node(value: 1)
            nodeB.next = nodeB
            assert(findEntrance(in: nodeB) == 1)
            
            
            print("\(self) OVER")
        }
    }
}

