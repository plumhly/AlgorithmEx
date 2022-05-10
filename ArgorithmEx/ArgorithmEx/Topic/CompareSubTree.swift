//
//  CompareSubTree.swift
//  ArgorithmEx
//
//  Created by Plum on 2021/10/26.
//

import Foundation

struct Topic26 {
    static func test() {
        Ex1.test()
    }
    
}


extension Topic26 {
    struct Ex1 {
        
        static func isSubTree(tree: Tree, sub: Tree) -> Bool {
            return compare(tree: tree, sub: sub)
        }
        
        private static func compare(tree: Tree?, sub: Tree?) -> Bool {
            guard let s = sub else {
                return true
            }
            
            guard let t = tree else {
                return false
            }
            
            let isContain: Bool
            
            if s.value == t.value {
                isContain = compareSubTree(tree: t, sub: s)
            } else {
                isContain = compare(tree: t.left, sub: sub) || compare(tree: t.right, sub: sub)
            }
            
            
            return isContain
        }
        
        private static func compareSubTree(tree: Tree?, sub: Tree?) -> Bool {
            guard let s = sub else {
                return true
            }
            
            guard let t = tree else {
                return false
            }
            
            var isContain: Bool = false
            if s.value == t.value {
                isContain = compareSubTree(tree: t.left, sub: s.left) && compareSubTree(tree: t.right, sub: s.right)
            }
            
            return isContain
        }
        
        
        static func test() {
            
            let tree1 = Tree(value: 1, left: Tree(value: 2, left: Tree(value: 4), right: Tree(value: 5)), right: Tree(value: 3, left: Tree(value: 6)))
            let sub1 = Tree(value: 3, left: Tree(value: 6))
            
            let sub2 = Tree(value: 3, left: Tree(value: 7))
            
            assert(isSubTree(tree: tree1, sub: sub1))
            
            assert(isSubTree(tree: tree1, sub: sub2) == false)
            
            print("\(self) OVER")
        }
    }
}

