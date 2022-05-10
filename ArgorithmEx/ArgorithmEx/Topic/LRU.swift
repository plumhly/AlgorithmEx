//
//  LRU.swift
//  ArgorithmEx
//
//  Created by Plum on 2021/10/27.
//

import Foundation

struct Topic70 {
    static func test() {
        Ex1.test()
    }
    
}


extension Topic70 {
    struct Ex1 {
        struct LRU {
            
            var head: Node<Int>?
            var tail: Node<Int>?
            
            var data: [Int : Node<Int>] = [:]
            
            let size: Int
            
            init(size: Int) {
                self.size = size
            }
            
            
            mutating
            func acess(value: Int) {
                if let node = data[value] {
                    if node != head {
                        if node == tail {
                            tail = node.pre
                        }
                        
                        node.pre?.next = node.next
                        node.next?.pre = node.pre
    
                        node.next = nil
                        node.pre = nil
                        
                        node.next = head
                        head?.pre = node
                        
                        head = node
                    }
                } else {
                    if data.count < size {
                        add(value: value)
                    } else {
                        removeLast()
                        add(value: value)
                    }
                }
            }
            
            mutating
            func add(value: Int) {
                let node = Node(value: value)
                
                data[value] = node
                
                node.next = head
                head?.pre = node
                
                head = node
                
                if tail == nil {
                    tail = node
                }
            }
            
            mutating
            func removeLast() {
                if let t = tail {
                    data.removeValue(forKey: t.value)
                    
                    let node = t.pre
                    t.pre = nil
                    node?.next = nil
                    tail = node
                }
            }
            
        }
        
        
        
        static func test() {
            
            var lru = LRU(size: 2)
            
            lru.acess(value: 1)
            lru.acess(value: 2)
            
            lru.acess(value: 1)
            lru.acess(value: 3)
            
            print("\(self) OVER")
        }
    }
}

