//
//  FindNextNode.swift
//  ArgorithmEx
//
//  Created by Plum on 2021/10/25.
//

import Foundation

struct Topic8 {
    static func test() {
        Ex1.test()
    }
}

extension Topic8 {
    struct Ex1 {
        static func findNextValue(tree: Tree) -> Int? {
            if var right = tree.right {
                var value = tree.value
                while let left = right.left {
                    value = left.value
                    right = left
                }
                
                return value
            } else {
                var tempTree: Tree? = tree
                var parent = tree.parent
                while parent != nil, parent?.left != tempTree {
                    tempTree = parent
                    parent = parent?.parent
                }
                
                return parent?.value
            }
            
        }
        
        static func test() {
            let node1 = Tree(value: 1)
            let node2 = Tree(value: 2)
            let node3 = Tree(value: 3)
            let node4 = Tree(value: 4)
            let node5 = Tree(value: 5)
            let node6 = Tree(value: 6)
            let node7 = Tree(value: 7)
            let node8 = Tree(value: 8)
            
            node1.left = node2
            node1.right = node3
            node2.parent = node1
            node3.parent = node1
            
            node2.left = node4
            node4.parent = node2
            
            node4.right = node7
            node7.parent = node4
            
            node3.left = node5
            node3.right = node6
            node5.parent = node3
            node6.parent = node3
            
            node6.left = node8
            node8.parent = node6
            
            assert(findNextValue(tree: node7) == 2)
            assert(findNextValue(tree: node3) == 8)
            assert(findNextValue(tree: node6) == nil)
            print("\(self) over")
        }
    }
}
