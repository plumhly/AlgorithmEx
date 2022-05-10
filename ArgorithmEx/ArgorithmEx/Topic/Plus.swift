//
//  Plus.swift
//  ArgorithmEx
//
//  Created by Plum on 2021/10/27.
//

import Foundation
struct Topic65 {
    static func test() {
        Ex1.test()
    }
    
}


extension Topic65 {
    struct Ex1 {
        
        static func add(l: Int, r: Int) -> Int {
            
            var n1 = l
            var n2 = r
            var carry = 0
            var sum = 0
            
            repeat {
                sum = n1 ^ n2
                carry = (n1 & n2) << 1
                
                n1 = sum
                n2 = carry
                
            } while n2 != 0
            
            return sum
        }
        
        static func test() {
            
            assert(add(l: 5, r: 7) == 12)
            
            print("\(self) OVER")
        }
    }
}

