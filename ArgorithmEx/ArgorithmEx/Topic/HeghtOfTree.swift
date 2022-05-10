//
//  HeghtOfTree.swift
//  ArgorithmEx
//
//  Created by Plum on 2021/10/27.
//

import Foundation

struct Topic56 {
    static func test() {
        Ex1.test()
    }
    
}


extension Topic56 {
    struct Ex1 {
        
        static func heightOf(tree: Tree) -> Int {
            
            let count = 1
            var subtreeHeight = 0
            if let leftTree = tree.left {
                let leftSubtreeHeight = heightOf(tree: leftTree)
                subtreeHeight = max(subtreeHeight, leftSubtreeHeight)
            }
            
            if let rightTree = tree.right {
                let rightTreeHeight = heightOf(tree: rightTree)
                subtreeHeight = max(subtreeHeight, rightTreeHeight)
            }
            
            return count + subtreeHeight
        }
        
        
        static func test() {
            let tree1 = Tree(value: 1, left: Tree(value: 2, left: Tree(value: 4), right: Tree(value: 5)), right: Tree(value: 3, left: Tree(value: 6)))
            assert(heightOf(tree: tree1) == 3)
            
            let tree2 = Tree(value: 1)
            assert(heightOf(tree: tree2) == 1)
            
            let tree3 = Tree(value: 1, left: Tree(value: 2, left: Tree(value: 3)))
            assert(heightOf(tree: tree3) == 3)
            print("\(self) OVER")
        }
    }
}

