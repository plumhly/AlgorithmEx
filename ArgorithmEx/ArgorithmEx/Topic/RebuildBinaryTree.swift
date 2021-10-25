//
//  RebuildBinaryTree.swift
//  ArgorithmEx
//
//  Created by Plum on 2021/10/25.
//

import Foundation

class Tree: NSObject {
    var left: Tree?
    var right: Tree?
    var parent: Tree?
    
    let value: Int
    
    init(value: Int, left: Tree? = nil, right: Tree? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
}

struct Topic7 {
    static func test() {
        Ex1.test()
    }
}

extension Topic7 {
    struct Ex1 {
        private static func rebuildBinayTree(from preArray: [Int], middleArray: [Int]) -> Tree? {
            return buildBinayTree(from: preArray, preStart: 0, preEnd: preArray.count - 1, middleArray: middleArray, middleStart: 0, middleEnd: middleArray.count - 1)
        }
        
        
        private static func buildBinayTree(from preArray: [Int], preStart: Int, preEnd: Int, middleArray: [Int], middleStart: Int, middleEnd: Int) -> Tree? {
            
            let root = preArray[preStart]
            
            let rootInMiddle = middleArray.firstIndex(of: root)!
            
            let leftTreeLength = rootInMiddle - middleStart
            let rightTreeLength = middleEnd - rootInMiddle
            
            let tree = Tree(value: root)
            
            if leftTreeLength > 0 {
                let leftTempPreStart = preStart + 1
                let leftTempPreEnd = preStart + leftTreeLength
                let leftMiddleStart = middleStart
                let leftMiddleEnd = rootInMiddle - 1
                
                tree.left = buildBinayTree(from: preArray, preStart: leftTempPreStart, preEnd: leftTempPreEnd, middleArray: middleArray, middleStart: leftMiddleStart, middleEnd: leftMiddleEnd)
            }
            
            if rightTreeLength > 0 {
                let rightTempPreStart = preStart + 1 + leftTreeLength
                let rightTempPreEnd = preEnd
                let rightMiddleStart = rootInMiddle + 1
                let rightMiddleEnd = middleEnd
                
                tree.right = buildBinayTree(from: preArray, preStart: rightTempPreStart, preEnd: rightTempPreEnd, middleArray: middleArray, middleStart: rightMiddleStart, middleEnd: rightMiddleEnd)
            }
            
            return tree
        }
        
        static func test() {
            let a1 = [1, 2, 4, 7, 3, 5, 6, 8]
            let a2 = [4, 7 , 2, 1, 5, 3, 8, 6]
            let t = rebuildBinayTree(from: a1, middleArray: a2)
            print("\(self) over")
        }
    }
    
}
