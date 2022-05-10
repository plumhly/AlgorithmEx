//
//  MirrorTree.swift
//  ArgorithmEx
//
//  Created by Plum on 2021/10/26.
//

import Foundation

struct Topic27 {
    static func test() {
        Ex1.test()
    }
    
}


extension Topic27 {
    struct Ex1 {
        
        @discardableResult
        static func mirror(tree: Tree?) -> Tree? {
            guard let t = tree else {
                return nil
            }
         
            let temp = t.left
            t.left = t.right
            t.right = temp
            
            mirror(tree: t.left)
            mirror(tree: t.right)
    
            return tree
        }
        
        static func test() {
            
            let tree1 = Tree(value: 1, left: Tree(value: 2, left: Tree(value: 4), right: Tree(value: 5)), right: Tree(value: 3, left: Tree(value: 6)))
            
            let result = mirror(tree: tree1)
            
            print("\(self) OVER")
        }
    }
}

