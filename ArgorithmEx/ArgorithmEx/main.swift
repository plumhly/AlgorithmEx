//
//  main.swift
//  ArgorithmEx
//
//  Created by Plum on 2021/10/25.
//

import Foundation

//Topic3.test()
//Topic4.test()
//Topic6.test()
//Topic7.test()
//Topic8.test()
//Topic9.test()
//Topic11.test()
//Topic12.test()
//Topic14.test()
//TopicN.test()
//Topic23.test()
//Topic26.test()
//Topic27.test()
//Topic32.test()
//Topic36.test()
//Topic51.test()
//Topic56.test()
//Topic59.test()
//Topic63.test() 
//Topic65.test()
//Topic70.test()
class TrieNode {
    // 经过的数量
    private(set) var path: Int = 0
    // 结尾的数量
    private(set) var end = 0
    
    private(set) var children: [Character: TrieNode] = [:]
    
    func insert(word: String) {
        guard !word.isEmpty else {
            return
        }
        
        var current = self
        for item in word {
            current.path += 1
            if let node = current.children[item] {
                // 如果当前已经含有该元素
                current = node
            } else {
                let node = TrieNode()
                current.children[item] = node
                current = node
            }
            
        }
        //结尾节点做好标注
        current.end += 1
    }
    
    func search(word: String) -> Bool {
        guard !word.isEmpty else {
            return false
        }
        
        let searchResult = find(word: word)
        
        return searchResult.result && searchResult.last.end > 0
    }
    
    private
    func find(word: String) -> (result: Bool, last: TrieNode) {
        var result = true
        var current = self
        
        for item in word {
            if let node = current.children[item] {
                current = node
                continue
            }
            
            result = false
            break
        }
        
        //查看是否是终点
        return (result, current)
    }
    
    func contain(prefix: String) -> Bool {
        guard !prefix.isEmpty else {
            return false
        }
        
        return find(word: prefix).result
    }
    
    func delete(word: String) {
        guard search(word: word) else {
            return
        }
        
        var current: TrieNode = self
        for item in word {
            current.path -= 1
            // 判断的数据
            // 1. 经过的数量
            // 2. 如果该路径既是单词又是路径，那么需要更新end
            if current.path == 0 {
                //移除
                current.children[item] = nil
                return
            }
            current = current.children[item]!
        }
        
        current.end -= 1
    }
}

let node = TrieNode()
node.insert(word: "hellow")
node.insert(word: "good")
node.insert(word: "goo")
let contain = node.search(word: "e")
assert(node.search(word: "go") == false)
assert(node.search(word: "good") == true)
assert(node.contain(prefix: "he") == true)
assert(node.contain(prefix: "dd") == false)
node.delete(word: "goo")
print("end")
