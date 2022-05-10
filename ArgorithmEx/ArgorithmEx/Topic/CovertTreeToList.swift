//
//  CovertTreeToList.swift
//  ArgorithmEx
//
//  Created by Plum on 2021/10/26.
//

import Foundation

struct Topic36 {
    static func test() {
        Ex1.test()
    }
    
}


extension Topic36 {
    struct Ex1 {
        
        static func covertTreeToList(tree: Tree) -> Tree? {
            return covert(tree: tree)?.header
        }
        
        static func covert(tree: Tree?) -> (header: Tree?, tail: Tree?)? {
            guard let t = tree else {
                return nil
            }
            
            let tempNode: Tree? = t
            
            var header: Tree? = tempNode
            var tail: Tree? = tempNode
            
            if let left = t.left, let leftNode = covert(tree: left) {
                leftNode.tail?.right = tempNode
                tempNode?.left = leftNode.tail
                
                header = leftNode.header
            }
            
            if let right = t.right {
                let rightNode = covert(tree: right)
                rightNode?.header?.left = tempNode
                tempNode?.right = rightNode?.header
                
                tail = rightNode?.tail
            }
            
            return (header, tail)
        }
        
        static func test() {
            
            let t = Tree(value: 10, left: Tree(value: 6, left: Tree(value: 4), right: Tree(value: 8)), right: Tree(value: 14, left: Tree(value: 12), right: Tree(value: 16)))
            
            let result = covertTreeToList(tree: t)
            
            print("\(self) OVER")
        }
    }
}

