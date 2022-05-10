import Foundation
import Darwin
/*
func findQueen(in metrix: Int) {
    guard metrix > 0 else {
        return
    }
    
    let row = metrix
    let column = metrix
    
    for r in 0 ..< row {
        var result: [Int] = [r]
        queen(row: 1, columnMax: column, rowMax: row, result: &result)
    }
}

func queen(row: Int, columnMax: Int, rowMax: Int, result: inout [Int]) {
    if row == rowMax - 1 {
        print(result)
        return
    }
    
    for c in 0 ..< columnMax where isPositionValid(row: row, column: c, result: result) {
        result.append(c)
        queen(row: row + 1, columnMax: columnMax, rowMax: rowMax, result: &result)
    }
}

func isPositionValid(row: Int, column: Int, result: [Int]) -> Bool {
    var isValid = true
    
    for (r, c) in result.enumerated() {
        if c == column || column - c == row - r || column - c == r - row {
            isValid = false
            break
        }
    }
    
    return isValid
}

//findQueen(in: 8)
//for (index, value) in [4, 5, 6].enumerated() {
//    print("\(index)")
//}
//
//var a: Int? = nil
//var b: Int? = nil
//a == b

//var a: [Int] = []
//var b: [Int] = []
//a == b
//a === b

let zero = Character("0")
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * 计算两个数之和
     * @param s string字符串 表示第一个整数
     * @param t string字符串 表示第二个整数
     * @return string字符串
     */
    func solve ( _ s: String,  _ t: String) -> String {
        // write code here
        if s.isEmpty {
            return t
        }
        
        if t.isEmpty {
            return s
        }
        
        let maxIndex = max(s.count, t.count) - 1
        var carry: UInt8 = 0
        
        var result = ""
        for i in 0 ... maxIndex {
            guard let sValue = value(in: s, distance: i) else {
                return ""
            }
            
            guard let tValue = value(in: t, distance: i) else {
                return ""
            }
            
            let sum = tValue + sValue + carry
            carry = sum / 10
            let value = sum % 10
            result.append("\(value)")
        }
        
        if carry > 0 {
            result.append("\(carry)")
        }
        
        return String(result.reversed())
    }
    
    func value(in string: String, distance: Int) -> UInt8? {
        var value: UInt8 = 0
        let d = distance + 1
        if string.count >= d {
            let index = string.index(string.endIndex, offsetBy: -d)
            if !isNumber(of: string[index]) {
                return nil
            }
            value = string[index].asciiValue! - zero.asciiValue!
        }
        
        return value
    }
    
    func isNumber(of character: Character) -> Bool {
        return true
    }
}

*/

//let so = Solution()
//so.solve(s, t)

//let sIndex = s.index(s.endIndex, offsetBy: -5)
//sIndex > s.startIndex
//s[sIndex]


/*
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * lru design
     * @param operators int整型二维数组 the ops
     * @param k int整型 the k
     * @return int整型一维数组
     */
    func LRU ( _ operators: [[Int]],  _ k: Int) -> [Int] {
        // write code here
        guard k > 0 else {
            return []
        }
        
        var result: [Int] = []
        var lruCache = RLUCache(size: k)
        
        for data in operators {
            switch data[0] {
            case 1:
                lruCache.set(value: data[2], forKey: data[1])
                
            case 2:
                let value = lruCache.get(key: data[1])
                result.append(value)
                
            default:
                break
            }
        }
        
        return result
    }
}


class NodeList {
    var val: Int?
    var next: NodeList?
    var pre: NodeList?
    let key: Int?
    init(val: Int? = nil, key: Int? = nil, next: NodeList? = nil, pre: NodeList? = nil) {
        self.val = val
        self.key = key
        self.next = next
        self.pre = pre
    }
}

struct NodeManager {
    let head = NodeList()
    let tail = NodeList()
    let size: Int
    var currentSize = 0
    
    init(size: Int) {
        self.size = size
        head.next = tail
        tail.pre = head
    }
    
    mutating
    func add(node: NodeList) {
        currentSize += 1
        head.next?.pre = node
        node.next = head.next
            
        head.next = node
        node.pre = head
    }
    
    mutating
    func removeTail() -> NodeList? {
        guard currentSize > 0 else {
            return nil
        }
        
        let tailNode = tail.pre!
        
        remove(node: tailNode)
        
        return tailNode
    }
    
    mutating
    func remove(node: NodeList) {
        guard currentSize > 0 else {
            return
        }
        
        node.pre?.next = node.next
        node.next?.pre = node.pre
        
        node.pre = nil
        node.next = nil
        
        currentSize -= 1
    }
    
    mutating
    func makeNodeAsHead(node: NodeList) {
        remove(node: node)
        add(node: node)
    }
}

struct RLUCache {
    let size: Int
    
    var data: [Int: NodeList] = [:]
    
    var nodeManager: NodeManager
    
    init(size: Int) {
        self.size = size
        nodeManager = NodeManager(size: size)
    }
    
    mutating
    func set(value: Int, forKey key: Int) {
        
        if let node = data[key] {
            node.val = value
            nodeManager.makeNodeAsHead(node: node)
        } else {
            let node = NodeList(val: value, key: key)
            let currentSize = data.count
            if currentSize == size, let tail = nodeManager.removeTail() {
                // 移除
                let key = tail.key!
                data.removeValue(forKey: key)
            }
            data[key] = node
            nodeManager.add(node: node)
        }
        
        
    }
    
    mutating
    func get(key: Int) -> Int {
        guard let node = data[key] else {
            return -1
        }
        
        nodeManager.makeNodeAsHead(node: node)
        
        return node.val!
    }
    
}
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int=0, _ left: TreeNode?=nil, _ right: TreeNode?=nil) {
      self.val = val
      self.left = left
      self.right = right
    }
}
/*
 最小k
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param input int整型一维数组
     * @param k int整型
     * @return int整型一维数组
     */
    func GetLeastNumbers_Solution ( _ input: [Int],  _ k: Int) -> [Int] {
        // write code here
        guard k > 0, input.count >= k else {
            return []
        }
        
        var index = 0
        var array = input
        let finalIndex = k - 1
        var startIndex = 0
        var endIndex = array.count - 1
        repeat {
            index = patition(&array, startIndex: startIndex, endIndex: endIndex)
            if index > finalIndex {
                endIndex = index - 1
            } else {
                startIndex = index + 1
            }
        } while index != finalIndex
        
        return Array(array[...finalIndex])
    }
    
    func patition(_ input: inout [Int], startIndex: Int, endIndex: Int) -> Int {
        guard startIndex < endIndex else {
            return startIndex
        }
        
        let privotValue = input[endIndex]
        
        var index = startIndex
        var replaceIndex = startIndex - 1
        
        while index < endIndex {
            if input[index] <= privotValue {
                replaceIndex += 1
                input.swapAt(replaceIndex, index)
            }
            index += 1
        }
        
        replaceIndex += 1
        input.swapAt(replaceIndex, endIndex)
        
        return replaceIndex
    }
}

struct MaxHeap {
    private(set) var data: [Int]
    let size: Int
    var currentSize: Int = 0
    
    init(size: Int) {
        self.size = size
        data = Array<Int>(repeating: Int.min, count: size)
    }
    
    mutating
    func add(value: Int) {
        if currentSize == size {
            if data[0] > value {
                data[0] = value
                heapify(at: 0)
            }
        } else {
            data[currentSize] = value
            currentSize += 1
            if size == currentSize {
                buildHeap()
            }
        }
    }
    
    mutating
    func buildHeap() {
        let lastParent = (size >> 1) - 1
        for i in stride(from: lastParent, through: 0, by: -1) {
            heapify(at: i)
        }
    }
    
    mutating
    func heapify(at index: Int) {
        let leftIndex = 2 * index + 1
        let rightIndex = 2 * index + 2
        
        var largestIndex = index
        if leftIndex < size, data[leftIndex] > data[index] {
            largestIndex = leftIndex
        }
        
        if rightIndex < size, data[rightIndex] > data[largestIndex] {
            largestIndex = rightIndex
        }
        
        if index != largestIndex {
            data.swapAt(index, largestIndex)
            heapify(at: largestIndex)
        }
    }
}

*/

/* 字符串翻转
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * 反转字符串
     * @param str string字符串
     * @return string字符串
     */
    func solve ( _ str: String) -> String {
        // write code here
        
        var string = Array(str)
        var endIndex = string.count - 1
        var startIndex = 0
        
        while startIndex < endIndex, endIndex != startIndex {
            string.swapAt(endIndex, startIndex)
            startIndex += 1
            endIndex -= 1
        }
        
        return String(string)
    }
}
 */

/*
// 螺旋矩阵
public class Solution {
    var row = 0
    var maxRow = 0
    
    var column = 0
    var maxColumn = 0
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param matrix int整型二维数组
     * @return int整型一维数组
     */
    func spiralOrder ( _ matrix: [[Int]]) -> [Int] {
        // write code here
        guard !matrix.isEmpty else {
            return []
        }
        
        maxRow = matrix.count - 1
        maxColumn = matrix[0].count - 1
        
        let minValue = min(matrix.count, matrix[0].count)
        var currentIndex = 0
        var result: [Int] = []
        while currentIndex * 2 < minValue {
            
            if maxColumn >= column {
                topLeftToTopRight(matrix: matrix, result: &result)
            }
            
            if maxRow >= row {
                topRightToBottomRight(matrix: matrix, result: &result)
            }
            
            if maxColumn >= column {
                bottomRightToBottomLeft(matrix: matrix, result: &result)
            }
            
            if maxRow >= row {
                bottomLeftToTopLeft(matrix: matrix, result: &result)
            }
            
            currentIndex += 1
        }
        
        return result
    }
    
    func topLeftToTopRight(matrix: [[Int]], result: inout [Int]) {
        guard row <= maxRow else {
            return
        }
        
        for c in column...maxColumn {
            result.append(matrix[row][c])
        }
        row += 1
    }
    
    func topRightToBottomRight(matrix: [[Int]], result: inout [Int]) {
        guard column <= maxColumn else {
            return
        }
        
        for r in row...maxRow {
            result.append(matrix[r][maxColumn])
        }
        maxColumn -= 1
    }
    
    func bottomRightToBottomLeft(matrix: [[Int]], result: inout [Int]) {
        guard row <= maxRow else {
            return
        }
        
        for c in stride(from: maxColumn, through: column, by: -1) {
            result.append(matrix[maxRow][c])
        }
        maxRow -= 1
    }
    
    func bottomLeftToTopLeft(matrix: [[Int]], result: inout [Int]) {
        guard column <= maxColumn else {
            return
        }
        
        for r in stride(from: maxRow, through: row, by: -1) {
            result.append(matrix[r][column])
        }
        
        column += 1
    }
}
*/

/*
// 最长回文子串长度
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param A string字符串
     * @return int整型
     */
    func getLongestPalindrome ( _ A: String) -> Int {
        // write code here
        return normal(A: A)
    }
    
    // 满足回文的条件
    // 1. 挨着的字符一样
    // 2. 奇数关于中心对称，否者查看挨着的是否一样
    func normal(A: String) -> Int {
        guard !A.isEmpty else {
            return 0
        }
        
        func palingdromeEven(str: String, cupIndex: Int) -> Int {
            let indexDistance = cupIndex >> 1
            let index = str.index(str.startIndex, offsetBy: indexDistance)
            
            let startIndex = str.startIndex
            let endIndex = str.index(before: str.endIndex)
            
            var length = 1
            guard index > startIndex, index < endIndex else {
                return length
            }
            
            var beforeIndex = str.index(before: index)
            var afterIndex = str.index(after: index)
            while beforeIndex >= startIndex, afterIndex <= endIndex, str[beforeIndex] == str[afterIndex] {
                length += 2
                if beforeIndex == str.startIndex {
                    break
                }
                beforeIndex = str.index(before: beforeIndex)
                afterIndex = str.index(after: afterIndex)
            }
            
            return length
        }
        
        func palingdromeOdd(str: String, cupIndex: Int) -> Int {
            let startDistance = (cupIndex - 1) >> 1
            let endDistance = (cupIndex + 1) >> 1
            
            var startIndex = str.index(str.startIndex, offsetBy: startDistance)
            var endIndex = str.index(str.startIndex, offsetBy: endDistance)
            var length = 0
            while startIndex >= str.startIndex, endIndex < str.endIndex, str[startIndex] == str[endIndex] {
                length += 2
                if startIndex == str.startIndex {
                    break
                }
                
                startIndex = str.index(before: startIndex)
                endIndex = str.index(after: endIndex)
            }
            
            return length
        }
        
        let cupCount = A.count - 1
        let finalCount = cupCount + A.count
        
        var length = 1
        for index in 0...finalCount - 1 {
            var len: Int
            if index % 2 == 0 {
                // 偶数
                len = palingdromeEven(str: A, cupIndex: index)
            } else {
                // 奇数
                len = palingdromeOdd(str: A, cupIndex: index)
            }
            length = max(length, len)
        }
        
        return length
    }
    
    func advance(A: String) -> Int {
        func change(str: String) -> [Character] {
            let finalCount = 2 * str.count + 1
            var result: [Character] = []
            for i in 0...finalCount - 1 {
                if i % 2 == 0 {
                    result.append(Character("#"))
                } else {
                    let distance = i / 2
                    let index = str.index(str.startIndex, offsetBy: distance)
                    result.append(str[index])
                }
            }

            return result
        }
        
        guard !A.isEmpty else {
            return 0
        }
        
        let cArray = change(str: A)
        print(cArray)
        var center = 0
        
        var radius = 0
        var plArray: [Int] = Array<Int>(repeating: 0, count: cArray.count)
        
        while center < cArray.count {
            //计算回文子串的半径
            // **** 这里需要根据radius来计算需要对比的位置，因为在判断右边需要跳过的点的时候，当刚好等于有边界需要从该半径继续计算可能的半径
            var leftBoundaryIndex = center - (radius + 1)
            var rightBoundaryIndex = center + (radius + 1)
            
            while leftBoundaryIndex >= 0, rightBoundaryIndex < cArray.count, cArray[leftBoundaryIndex] == cArray[rightBoundaryIndex] {
                radius += 1
                
                leftBoundaryIndex -= 1
                rightBoundaryIndex += 1
            }
            
            plArray[center] = radius
            // 这里判断在右边的半径里面的元素那些可以跳过计算其回文字符串
            let oldCenter = center
            let oldRadius = radius
            
            center += 1
            // 重置
            radius = 0
            
            let rightMax = oldCenter + oldRadius
            
            while center <= rightMax {
                let mirrorIndex = 2 * oldCenter - center
                // 情况1,对称点的回文完全包含在左边的半径内
                if center + plArray[mirrorIndex] < rightMax  {
                    plArray[center] = plArray[mirrorIndex]
                } else if center + plArray[mirrorIndex] > rightMax {
                    // 情况2：对称点的回文长度超过了左边界，这情况下该点的回文最多是到右边界 dcbabcdxdcbabce
                    plArray[center] = rightMax - center
                } else {
                    // 情况3：这种情况下，该节点的回文长度可能还会增长 abcdcbabcdxdcbabcdxdcb
                    radius = plArray[mirrorIndex] // 或者 rightMax - center
                    break
                }
                center += 1
            }
        }
        
        var maxValue = 0
        for value in plArray {
            maxValue = max(maxValue, value)
        }
        
        return maxValue
    }
}

//var str = "dfsdf"
//str.index(before: str.startIndex)
//str.index(after: str.endIndex)

//var s = "ababc"
//Solution().advance(A: s)
*/

/*
// 三数之和
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param num int整型一维数组
     * @return int整型二维数组
     */
    func threeSum ( _ num: [Int]) -> [[Int]] {
        guard num.count >= 3 else {
            return []
        }
        // write code here
        let array = num.sorted()
        var result: [[Int]] = []
        
        for(index, value) in array.enumerated() {
            if array.count - index < 3  {
                break
            }
            
            let preIndex = index - 1
            
            // 跳过重复元素，避免重复解
            if preIndex >= 0, array[preIndex] == value {
                continue
            }
            
            let ramin = 0 - value
            var start = index + 1
            var end = array.count - 1
            
            while start < end {
                let sum = array[start] + array[end]
                if sum > ramin {
                    end -= 1
                } else if sum < ramin {
                    start += 1
                } else {
                    //找到了
                    let startValue = array[start]
                    let endValue = array[end]
                    result.append([value, startValue, endValue])
                    // 移动指针，避免重复的值
                    start += 1
                    while start < end, array[start] == startValue {
                        start += 1
                    }
                    
                    end -= 1
                    while start < end, array[end] == endValue {
                        end -= 1
                    }
                }
            }
        }
        
        return result
    }
}
*/

/*
// 重建二叉树
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param pre int整型一维数组
     * @param vin int整型一维数组
     * @return TreeNode类
     */
    func reConstructBinaryTree ( _ pre: [Int],  _ vin: [Int]) -> TreeNode? {
        guard !pre.isEmpty, !vin.isEmpty, vin.count == pre.count else {
            return nil
        }
        
        // write code here
        var inIndexDic: [Int: Int] = [:]
        for (index, value) in vin.enumerated() {
            inIndexDic[value] = index
        }
        
        return constructTree(pre: pre, preStartIndex: 0, preEndIndex: pre.count - 1, vin: vin, inStartIndex: 0, inEndIndex: vin.count - 1, inIndexDic: inIndexDic)
    }
    
    func constructTree(pre: [Int], preStartIndex: Int, preEndIndex: Int, vin: [Int], inStartIndex: Int, inEndIndex: Int, inIndexDic: [Int: Int]) -> TreeNode? {
        guard preStartIndex <= preEndIndex, inStartIndex <= inEndIndex else {
            return nil
        }
        
        let rootValue = pre[preStartIndex]
        let rootTree = TreeNode(rootValue)
        
        guard let rootValueIndex = inIndexDic[rootValue] else {
            fatalError()
        }
        
        // 构建左子树
        let leftTreeLength = rootValueIndex - inStartIndex
        if leftTreeLength > 0 {
            let newPreStart = preStartIndex + 1
            let newPreEnd = preStartIndex + leftTreeLength
            let newInStart = inStartIndex
            let newInEnd = rootValueIndex - 1
            rootTree.left = constructTree(pre: pre, preStartIndex: newPreStart, preEndIndex: newPreEnd, vin: vin, inStartIndex: newInStart, inEndIndex: newInEnd, inIndexDic: inIndexDic)
        }
        
        // 构建右子树
        let rightTreeLength = inEndIndex - rootValueIndex
        if rightTreeLength > 0 {
            let newPreStart = preStartIndex + leftTreeLength + 1
            let newPreEnd = preEndIndex
            let newInStart = rootValueIndex + 1
            let newInEnd = inEndIndex
            rootTree.right = constructTree(pre: pre, preStartIndex: newPreStart, preEndIndex: newPreEnd, vin: vin, inStartIndex: newInStart, inEndIndex: newInEnd, inIndexDic: inIndexDic)
        }
        
        return rootTree
    }
}
*/


// 最长上升序列
//public class Solution {
//    /**
//     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
//     * retrun the longest increasing subsequence
//     * @param arr int整型一维数组 the array
//     * @return int整型一维数组
//     */
//    func LIS ( _ arr: [Int]) -> [Int] {
//        // write code here
//        return dp(array: arr)
//    }
//
//    // 贪心
//    func greedy(array: [Int]) -> [Int] {
//        guard array.count > 1 else {
//            return array
//        }
//
//        var d = Array<Int>(repeating: 0, count: array.count + 1)
//        var p = Array<Int>(repeating: 1, count: array.count)
//
//        var len = 1
//        d[1] = array[0]
//
//        for i in 1...array.count - 1 {
//            if array[i] > d[len] {
//                len += 1
//                d[len] = array[i]
//                p[i] = len
//            } else { //***1 这里等于也需要更新
//                // 找到第一个比 array[i] 小的数。二分查找
//                var start = 1
//                var end = len
//                var position = 0
//
//                while start <= end {
//                    let mid = (start + end) >> 1
//                    if d[mid] < array[i] {
//                        position = mid
//                        start = mid + 1
//                    } else {
//                        end = mid - 1
//                    }
//                }
//                position += 1
//                d[position] = array[i]
//                p[i] = position
//            }
//        }
//
//        var result = Array<Int>(repeating: 0, count: len)
//        for i in stride(from: array.count - 1, through: 0, by: -1) {
//            if p[i] == len {
//                len -= 1
//                result[len] = array[i]
//            }
//        }
//
//        return result
//    }
//
//    // 动态规划
//    func dp(array: [Int]) -> [Int] {
//        guard array.count > 1 else {
//            return array
//        }
//
//        var dp: [Int] = Array<Int>(repeating: 1, count: array.count)
//        var maxLength = 1
//        for i in 1...array.count - 1 {
//            for j in 0..<i {
//                if array[j] < array[i] {
//                    dp[i] = max(dp[i], dp[j] + 1)
//                }
//            }
//            maxLength = max(dp[i], maxLength)
//        }
//
//        // 获取数组信息，dp倒序
//        var result = Array<Int>(repeating: 0, count: maxLength)
//        var j = maxLength
//        for index in stride(from: array.count - 1, through: 0, by: -1) {
//            if dp[index] == j {
//                j -= 1
//                result[j] = array[index]
//            }
//        }
//
//        return result
//    }
//}

/*
// 求平方根
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param x int整型
     * @return int整型
     */
    func sqrt ( _ x: Int) -> Int {
        // write code here
        guard x > 1 else {
            return x
        }
        
        var end = x >> 1
        var start = 1
        var result = 1
        while start <= end {
            let middle = (start + end) >> 1
            let re = middle * middle
            if re < x {
                // *** 因为是向下取整，那么这个 result = middle放在前面，并且只是middle而不是start
                result = middle
                start = middle + 1
            } else if re > x {
                end = middle - 1
            } else {
                result = middle
                break
            }
        }
        
        return result
    }
}
*/

/*
//在旋转过的有序数组中寻找目标值
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param nums int整型一维数组
     * @param target int整型
     * @return int整型
     */
    func search ( _ nums: [Int],  _ target: Int) -> Int {
        // write code here
        guard !nums.isEmpty else {
            return -1
        }
        
        var start = 0
        var end = nums.count - 1
        var resultIndex = -1
        
        while start <= end {
            let startValue = nums[start]
            let endValue = nums[end]
            
            let middle = (start + end) >> 1
            let middleValue = nums[middle]
            if target == startValue  {
                resultIndex = start
                break
            } else if target == endValue {
                resultIndex = end
                break
            } else if middleValue == target {
                resultIndex = middle
                break
            } else {
                // 前部分为升序
                if middleValue > startValue {
                    if target > middleValue || target < startValue  {
                        start = middle + 1
                    } else {
                        end = middle - 1
                    }
                } else {
                    // 后部分完全升序
                    if target < middleValue || target > endValue {
                        end = middle - 1
                    } else {
                        start = middle + 1
                    }
                }
            }
        }
        
        return resultIndex
    }
}
*/
/*
// 包含min函数的栈
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param value int整型
     * @return 无
     */
    var data: [Int] = []
    var minIndexes: [Int] = []
    
    func push ( _ value: Int) {
        // write code here
        data.append(value)
        if minIndexes.isEmpty {
            minIndexes.append(0)
        } else {
            if let index = minIndexes.last, data[index] > value {
                minIndexes.append(data.count - 1)
            }
        }
    }

    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param 无
     * @return 无
     */
    func pop () {
        // write code here
        guard !data.isEmpty else {
            return
        }
        
        if let minIndex = minIndexes.last, minIndex == data.count - 1 {
            minIndexes.removeLast()
        }
        data.removeLast()
    }

    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param 无
     * @return int整型
     */
    func top () -> Int {
        // write code here
        guard !data.isEmpty else {
            return 0
        }
        
        return data.last!
    }

    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param 无
     * @return int整型
     */
    func min () -> Int {
        // write code here
        guard !minIndexes.isEmpty else {
            return 0
        }
        
        let index = minIndexes.last!
        return data[index]
    }
}
*/

/*
//买卖股票的最好时机
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param prices int整型一维数组
     * @return int整型
     */
    func maxProfit ( _ prices: [Int]) -> Int {
        // write code here
        guard prices.count > 1 else {
            return 0
        }
        
        var minPrice = Int.max
        var maxProfit = 0
        for price in prices {
            if minPrice > price {
                minPrice = price
            } else {
                maxProfit = max(maxProfit, price - minPrice)
            }
        }
        
        return maxProfit
    }
}
*/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int = 0, _ next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}

/*
//合并k个已排序的链表

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param lists ListNode类一维数组
     * @return ListNode类
     */
    func mergeKLists ( _ lists: [ListNode?]) -> ListNode? {
        guard !lists.isEmpty else {
            return nil
        }
        // write code here
        return mergeList(list: lists, startIndex: 0, endIndex: lists.count - 1)
    }
    
    func mergeList(list: [ListNode?], startIndex: Int, endIndex: Int) -> ListNode? {
        guard startIndex <= endIndex else {
            return nil
        }
        
        if startIndex == endIndex {
            return list[startIndex]
        }
        
        let middleIndex = (startIndex + endIndex) >> 1
        let list1 = mergeList(list: list, startIndex: startIndex, endIndex: middleIndex)
        let list2 = mergeList(list: list, startIndex: middleIndex + 1, endIndex: endIndex)
        
        return mergeTwoList(list1: list1, list2: list2)
    }
    
    func orderMerge(lists: [ListNode]) -> ListNode? {
        var node: ListNode?
        for list in lists {
            node = mergeTwoList(list1: node, list2: list)
        }
        
        return node
    }
    
    func mergeTwoList(list1: ListNode?, list2: ListNode?) -> ListNode? {
        guard let l1 = list1 else {
            return list2
        }
        
        guard let l2 = list2 else {
            return list1
        }
        
        var head: ListNode? = nil
        var tail: ListNode? = nil
        var tempNode1: ListNode? = l1
        var tempNode2: ListNode? = l2
        
        while let tmp1 = tempNode1, let tmp2 = tempNode2 {
            var node: ListNode
            if tmp1.val < tmp2.val {
                node = tmp1
                tempNode1 = tmp1.next
            } else {
                node = tmp2
                tempNode2 = tmp2.next
            }
            
            node.next = nil
            
            if head == nil {
                head = node
                tail = node
            } else {
                tail?.next = node
                tail = node
            }
        }
        
        // 如果list1还有数据
        if let temp1 = tempNode1 {
            tail?.next = temp1
        }
        
        // 如果list2还有数据
        if let temp2 = tempNode2 {
            tail?.next = temp2
        }
        
        return head
    }
}
*/


/*
// 字符串的排列
/**
 *
 *陷阱
 *  1. 防止string重复，用set
 */
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param str string字符串
     * @return string字符串一维数组
     */
    func Permutation ( _ str: String) -> [String] {
        // write code here
        guard str.count > 0 else {
            return []
        }
        
        var result: Set<String> = []
        var strArray = Array(str)
        permutation(str: &strArray, index: 0, result: &result)
        
        return Array(result)
    }
    
    func permutation(str: inout [Character], index: Int, result: inout Set<String>) {
        guard index < str.count - 1 else {
            result.insert(String(str))
            return
        }
        
        
        for i in index..<str.count {
            str.swapAt(index, i)
            permutation(str: &str, index: index + 1, result: &result)
            str.swapAt(i, index)
        }
    }
}
*/

/*
// 1 需要实时减去当前两个大值中间的needReduce，并重置needReduce = 0
// 2 考虑两个最大值相等的情况
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * max water
     * @param arr int整型一维数组 the array
     * @return long长整型
     */
    func maxWater ( _ arr: [Int]) -> Int64 {
        // write code here
        // 从左到右记录左边的最大值
        guard arr.count > 1 else {
            return 0
        }
        
        return method2(arr: arr)
    }
    
    // 分别记录左边和右边的最大值
    func method1(arr: [Int]) -> Int64 {
        var currentMax = -1
        var currentMaxIndex = -1
        var needReduce = 0
        var totalSize = 0
        for (index, value) in arr.enumerated() {
            if value >= currentMax {
                if currentMax > 0 {
                    let minValue = min(currentMax, value)
                    let width = index - currentMaxIndex - 1
                    let size = minValue * width
                    totalSize += size - needReduce
                    needReduce = 0
                }
                currentMaxIndex = index
                currentMax = value
            } else {
                needReduce += value
            }
        }
        
        needReduce = 0
        currentMax = -1
        currentMaxIndex = -1
        // 从右到左记录右边的最大值
        for index in stride(from: arr.count - 1, to: 0, by: -1) {
            let value = arr[index]
            if value > currentMax {
                if currentMax >= 0 {
                    let minValue = min(currentMax, value)
                    let width = currentMaxIndex - index  - 1
                    let size = minValue * width
                    totalSize += size - needReduce
                    needReduce = 0
                }
                currentMaxIndex = index
                currentMax = value
            } else {
                needReduce += value
            }
        }
        
        return Int64(totalSize)
    }
    
    
    // 双指针
    // https://leetcode-cn.com/problems/trapping-rain-water/solution/jie-yu-shui-by-leetcode-solution-tuvc/
    func method2(arr: [Int]) -> Int64 {
        var leftIndex = 0
        var rightIndex = arr.count - 1
        var leftMax = 0
        var rightMax = 0
        var size = 0
        
        while leftIndex < rightIndex {
            leftMax = max(arr[leftIndex], leftMax)
            rightMax = max(arr[rightIndex], rightMax)
            
            // 如果左边
            if arr[leftIndex] < arr[rightIndex] {
                size += leftMax - arr[leftIndex]
                leftIndex += 1
            } else {
                size += rightMax - arr[rightIndex]
                rightIndex -= 1
            }
        }
        
        return Int64(size)
    }
}

//[1, 2].endIndex
*/

struct Queue<T> {
    private var data: [T] = []
    
    var isEmpty: Bool {
        return data.isEmpty
    }
    
    var count: Int {
        return data.count
    }
    
    mutating
    func enqueue(value: T) {
        data.append(value)
    }
    
    mutating
    func dequeue() -> T? {
        guard !data.isEmpty else {
            return nil
        }
        
        return data.removeFirst()
    }
    
    func front() -> T? {
        return data.first
    }
    
    func end() -> T? {
        return data.last
    }
    
    mutating
    func removeEnd() -> T? {
        return data.isEmpty ? nil : data.removeLast()
    }
}

/*
// 输出二叉树的右视图
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * 求二叉树的右视图
     * @param xianxu int整型一维数组 先序遍历
     * @param zhongxu int整型一维数组 中序遍历
     * @return int整型一维数组
     */
    func solve ( _ xianxu: [Int],  _ zhongxu: [Int]) -> [Int] {
        // write code here
        guard !xianxu.isEmpty, xianxu.count == zhongxu.count else {
            return []
        }
        
        guard let tree = buildTree(preArray: xianxu, infixArray: zhongxu) else {
            return []
        }
        
        return rightView(on: tree)
    }
    
    func buildTree(preArray: [Int], infixArray: [Int]) -> TreeNode? {
        var infixDic: [Int: Int] = [:]
        for (index, value) in infixArray.enumerated() {
            infixDic[value] = index
        }
        
        return buildTree(preArray: preArray, pStartIndex: 0, pEndIndex: preArray.count - 1, infixArray: infixArray, iStartIndex: 0, iEndIndex: infixArray.count - 1, infixDic: infixDic)
    }
    
    func buildTree(preArray: [Int], pStartIndex: Int, pEndIndex: Int, infixArray: [Int], iStartIndex: Int, iEndIndex: Int, infixDic: [Int: Int]) -> TreeNode? {
        guard pStartIndex <= pEndIndex else {
            return nil
        }
        
        let rootValue = preArray[pStartIndex]
        let rootNode = TreeNode(rootValue)
        if pStartIndex == pEndIndex {
            return rootNode
        }
        
        guard let rootValueIndex = infixDic[rootValue] else {
            return nil
        }
        
        let leftTreeLength = rootValueIndex - iStartIndex
        let rightTreeLength = iEndIndex - rootValueIndex
        
        if leftTreeLength > 0 {
            let tempPStartIndex = pStartIndex + 1
            let tempPEndIndex = pStartIndex + leftTreeLength
            
            let tempIStartIndex = iStartIndex
            let tempIEndIndex = rootValueIndex - 1
            
            rootNode.left = buildTree(preArray: preArray, pStartIndex: tempPStartIndex, pEndIndex: tempPEndIndex, infixArray: infixArray, iStartIndex: tempIStartIndex, iEndIndex: tempIEndIndex, infixDic: infixDic)
        }
        
        if rightTreeLength > 0 {
            let tempPStartIndex = pStartIndex + leftTreeLength + 1
            let tempPEndIndex = pEndIndex
            
            let tempIStartIndex = rootValueIndex + 1
            let tempIEndIndex = iEndIndex
            
            rootNode.right = buildTree(preArray: preArray, pStartIndex: tempPStartIndex, pEndIndex: tempPEndIndex, infixArray: infixArray, iStartIndex: tempIStartIndex, iEndIndex: tempIEndIndex, infixDic: infixDic)
        }
     
        return rootNode
    }
    
    func rightView(on tree: TreeNode?) -> [Int] {
        guard let t = tree else {
            return []
        }
        
        var queue = Queue<TreeNode>()
        queue.enqueue(value: t)
        
        var result: [Int] = []
        var size = queue.count
        while !queue.isEmpty, let tr = queue.dequeue() {
            
            if let lt = tr.left {
                queue.enqueue(value: lt)
            }
            
            if let rt = tr.right {
                queue.enqueue(value: rt)
            }
            
            size -= 1
            if size == 0 {
                result.append(tr.val)
                size = queue.count
            }
        }
        
        return result
    }
}
*/

/*
// 岛屿数量
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * 判断岛屿数量
     * @param grid char字符型二维数组
     * @return int整型
     */
    func solve ( _ grid: [[Character]]) -> Int {
        guard !grid.isEmpty else {
            return 0
        }
        
        guard !grid[0].isEmpty else {
            return 0
        }
        
        let rowMax = grid.count
        let columMax = grid[0].count
        
        var count = 0
        var grid = grid
        for row in 0..<rowMax {
            for colum in 0..<columMax {
                if grid[row][colum] == Character("1") {
                    count += 1
                    dfs(grid: &grid, row: row, column: colum)
                }
            }
        }
        
        return count
    }
    
    func dfs(grid: inout [[Character]] ,row: Int, column: Int) {
        guard row >= 0, row < grid.count, column >= 0, column < grid[0].count else {
            return
        }
        
        if grid[row][column] == Character("0") {
            return
        }
        
        grid[row][column] = Character("0")
        dfs(grid: &grid, row: row - 1, column: column)
        dfs(grid: &grid, row: row + 1, column: column)
        dfs(grid: &grid, row: row, column: column - 1)
        dfs(grid: &grid, row: row, column: column + 1)
    }
    
    /**
     我的想法：保留上一行和前一个index的信息，然后判断是否应该考虑成岛屿。
     错误的点在于：可能从右到左连续
     0 0 0 0 1
     1 1 1 1 1
     结果：1
     我的算法：2
     */
    func wrong( _ grid: [[Character]]) -> Int {
        // write code here
        guard !grid.isEmpty else {
            return 0
        }
        
        var count = 0
        var flags: [Character] = []
        
        for (row, items) in grid.enumerated() {
            var preIndex = -1
            for (column, item) in items.enumerated() {
                if row > 0 {
                    if preIndex == -1 {
                        //只比较上面的
                        if item == Character("1"), flags[column] != item {
                            count += 1
                        }
                    } else {
                        //比较前面和上面
                        if item == Character("1"), flags[column] != item, items[preIndex] != item {
                            count += 1
                        }
                    }
                } else {
                    if item == Character("1"), (preIndex == -1 || items[preIndex] != item) {
                        count += 1
                    }
                }
                
                preIndex = column
            }
            flags = items
        }
        
        return count
    }
}
*/

/*
//二叉树的最大深度
//要求：空间复杂度 O(1),时间复杂度O(n)
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param root TreeNode类
     * @return int整型
     */
    func maxDepth ( _ root: TreeNode?) -> Int {
        // write code here
        guard let r = root else {
            return 0
        }
        
        let leftTreeHight = maxDepth(r.left)
        let rightTreeHight = maxDepth(r.right)
        
        return max(leftTreeHight, rightTreeHight) + 1
    }
}
*/

/*
//判断是否为回文字符串
//空间复杂度 O(1)，时间复杂度 O(n)
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param str string字符串 待判断的字符串
     * @return bool布尔型
     */
    func judge ( _ str: String) -> Bool {
        // write code here
        guard str.count > 1 else {
            return true
        }
        
        var startIndex = str.startIndex
        var endIndex = str.index(before: str.endIndex)
        
        while startIndex < endIndex {
            if str[startIndex] != str[endIndex] {
                break
            }
            
            startIndex = str.index(after: startIndex)
            endIndex = str.index(before: endIndex)
        }
        
        return startIndex >= endIndex
    }
}
*/

/*
//单链表的排序
//空间复杂度 O(n)，时间复杂度O(nlogn)
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param head ListNode类 the head node
     * @return ListNode类
     */
    func sortInList ( _ head: ListNode?) -> ListNode? {
        // write code here
//        return sort1(head: head)
        return sort2(head: head)

    }
    
    /*
     自底向上
     时间复杂度：O(nlogn)，其中 n 是链表的长度。
     空间复杂度：O(1)
     */
    func sort2(head: ListNode?) -> ListNode? {
        
        let totalLength = length(of: head)
        guard totalLength > 1 else {
            return head
        }
        
        var subLength = 1
        var header: ListNode? = head
        var tail: ListNode? = nil
        
        var current = header
        while subLength < totalLength {
//            var l = subLength
            current = header
            header = nil
            tail = nil
            
            while current != nil {
                // **⚠️ 这句代码导致我调试了起码3个小时
                var l = subLength
                // 指向头节点
                let n1 = current
                
                while l > 1, current != nil {
                    current = current?.next
                    l -= 1
                }
                
                // 断链
                let tail1 = current
                current = current?.next
                tail1?.next = nil
                
                // 重置长度
                l = subLength
                let n2 = current
                
                while l > 1, current != nil {
                    current = current?.next
                    l -= 1
                }
                
                let tail2 = current
                current = current?.next
                tail2?.next = nil
                
                let node = mergeTwoListOrderly(a: n1, b: n2)
                if tail == nil {
                    header = node
                } else {
                    tail?.next = node
                }
                tail = node
                
                // 追溯到尾结点
                while let next = tail?.next {
                    tail = next
                }
            }
            subLength <<= 1
        }
        
        return header
    }
    
    func length(of list: ListNode?) -> Int {
        guard let l = list else {
            return 0
        }
        
        var length = 1
        var temp = l.next
        while temp != nil {
            temp = temp?.next
            length += 1
        }
        
        return length
    }
    
    /*
     自顶向下
     时间复杂度：O(nlogn)，其中 n 是链表的长度。
     空间复杂度：O(logn)，其中 n 是链表的长度。空间复杂度主要取决于递归调用的栈空间。
     链接：https://leetcode-cn.com/problems/sort-list/solution/pai-xu-lian-biao-by-leetcode-solution/
     */
    func sort1(head: ListNode?) -> ListNode? {
        guard head != nil, head?.next != nil else {
            return head
        }
        
        var slow = head
        var fast = head?.next
        while let fst = fast, fst.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        // **** ⚠️必须把head 隔断，不然没有起到分割的作用
        let head2 = slow?.next
        slow?.next = nil
        let firstNode = sort1(head: head)
        let secodeNode = sort1(head: head2)
        
        return mergeTwoListOrderly(a: firstNode, b: secodeNode)
    }
    
    func mergeTwoListOrderly(a: ListNode?, b: ListNode?) -> ListNode? {
        guard a != nil else {
            return b
        }
        
        guard b != nil else {
            return a
        }
        
        var aList = a
        var bList = b
        var head: ListNode? = nil
        var index: ListNode? = nil
        
        while let al = aList, let bl = bList {
            var tempNode: ListNode
            if al.val <= bl.val {
                tempNode = al
                aList = al.next
                al.next = nil
            } else {
                tempNode = bl
                bList = bl.next
                bl.next = nil
            }
            if index == nil {
                head = tempNode
            } else {
                index?.next = tempNode
            }
            index = tempNode
        }
        
        if aList != nil {
            index?.next = aList
        }
        
        if bList != nil {
            index?.next = bList
        }
        
        return head
    }
}

func generateNode(list: [Int]) -> ListNode? {
    guard !list.isEmpty else {
        return nil
    }
    
    var hader: ListNode? = nil
    var tail: ListNode? = nil
    for value in list {
        let node = ListNode(value)
        if tail == nil {
            hader = node
        } else {
            tail?.next = node
        }
        tail = node
    }
    
    return hader
}

//[1,3,2,4,5]
let n = ListNode(1, ListNode(3,ListNode(2,ListNode(4,ListNode(-5)))))
let n1 = ListNode(1, ListNode(3,ListNode(2,ListNode(-4))))
let n3 = generateNode(list: [-426572,-406609,724427,-157789,-132713,720732,-39078,-348926,-693458,559374,114739,-748249,428207,-767407,401563,646432,-682870,483610,-608888,94840,749542,359115,131739,935294,347325,80573,-869091,-757897,-860166,-227942,-484068,-170790,-362441,-860466,819197,817675,886101,463504,-100482,496406,-860791])
let node = Solution().sort2(head: n3)
*/

/*
// 判断是不是平衡二叉树
// 空间复杂度O(lgn)，时间复杂度 O(n)
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param pRoot TreeNode类
     * @return bool布尔型
     */
    func IsBalanced_Solution ( _ pRoot: TreeNode?) -> Bool {
        // write code here
        
        return balance(tree: pRoot).isBalance
    }
    
    func balance(tree: TreeNode?) -> (height: Int, isBalance: Bool) {
        guard let t = tree else {
            return (0, true)
        }
        
        let (leftHeight, isLeftBalance) = balance(tree: t.left)
        let (rightHeight, isRightBalance) = balance(tree: t.right)
        
        let isBalance = isLeftBalance && isRightBalance && abs(leftHeight - rightHeight) <= 1
        let height = max(leftHeight, rightHeight) + 1
        
        return (height, isBalance)
    }
}
*/

/*
//数组中出现次数超过一半的数字
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param numbers int整型一维数组
     * @return int整型
     */
    func MoreThanHalfNum_Solution ( _ numbers: [Int]) -> Int {
        var preValue = Int.max
        var count = 0
        for value in numbers {
            if count == 0 {
                preValue = value
                count += 1
            } else {
                if preValue != value {
                    count -= 1
                } else {
                    count += 1
                }
            }
        }
        
        return preValue
    }
    /*
    func MoreThanHalfNum_Solution ( _ numbers: [Int]) -> Int {
        // write code here
        guard !numbers.isEmpty else {
            return 0
        }
        
        guard numbers.count > 1 else {
            return numbers[0]
        }
        
        var numbers = numbers
        var index = 0
        var startIndex = 0
        var endIndex = numbers.count - 1
        let finalIndex = numbers.count / 2
        
        while index != finalIndex {
            index = partition(&numbers, startIndex: startIndex, endIndex: endIndex)
            print(index)
            if index < finalIndex {
                startIndex = index
            } else {
                endIndex = index
            }
        }
        
        return numbers[index]
    }
    
    func partition(_ numbers: inout [Int], startIndex: Int, endIndex: Int) -> Int {
        let privotValue = numbers[endIndex]
        var swapIndex = startIndex - 1
        var startIndex = startIndex
        while startIndex < endIndex {
            if numbers[startIndex] <= privotValue {
                swapIndex += 1
                numbers.swapAt(swapIndex, startIndex)
            }
            
            startIndex += 1
        }
        
        swapIndex += 1
        numbers.swapAt(endIndex, swapIndex)
        
        return swapIndex
    }
     */
}

//[1,2,3,2,2,2,5,4,2]
*/

/*
// 矩阵的最小路径和
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param matrix int整型二维数组 the matrix
     * @return int整型
     */
    func minPathSum ( _ matrix: [[Int]]) -> Int {
        // write code here
        guard !matrix.isEmpty, !matrix[0].isEmpty else {
            return 0
        }
        
        let row = matrix.count
        let column = matrix[0].count
        
        var data = Array<Int>(repeating: 0, count: column)
        
        for r in 0..<row {
            for c in 0..<column {
                /**
                 ***注意
                 *1. 因为是取最小路径，所以无效值要用 Int.max
                 *2.c=0,r=0要单独判断。不然两个无效值都是 Int.max
                 */
                
                let preValue = c > 0 ? data[c - 1] : Int.max
                let topValue = r > 0 ? data[c] : Int.max
                let finalValue = (c == 0 && r == 0) ? 0 : min(preValue, topValue)
                data[c] = finalValue + matrix[r][c]
            }
            print(data)
        }
        
        return data.last!
    }
}

Solution().minPathSum([[1,3,5,9],[8,1,3,4],[5,0,6,1],[8,8,4,0]])
*/

struct Stack<T> {
    var data: [T] = []
    
    var count: Int {
        return data.count
    }
    
    var isEmpty: Bool {
        return data.isEmpty
    }
    
    mutating
    func pop() -> T? {
        guard !data.isEmpty else {
            return nil
        }
        
        return data.removeLast()
    }
    
    mutating
    func push(value: T) {
        data.append(value)
    }
    
    func peek() -> T? {
        return data.last
    }
}

/*
//表达式求值
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * 返回表达式的值
     * @param s string字符串 待计算的表达式
     * @return int整型
     */
    func solve( _ s: String) -> Int {
        // write code here
        guard !s.isEmpty else {
            return 0
        }
        
        var values = Stack<Int>()
        var number = 0
        var asign = Character("+")
        
        var stemp = s.startIndex
        
        for index in sequence(first: stemp, next: {$0 < s.index(before: s.endIndex) ? s.index(after: stemp) : nil}) {
//            print(index)
            let value = s[index]
            stemp = index
            if value == " " {
                continue
            } else if value == "(" {
                // 寻找与之匹配的 ）
                var countPart = 1
                stemp = s.index(after: index)
                while countPart != 0, stemp < s.endIndex {
                    if s[stemp] == "(" {
                        countPart += 1
                    }
                    if s[stemp] == ")" {
                        countPart -= 1
                    }
                    stemp = s.index(after: stemp)
                }
                
                if countPart != 0 {
                    fatalError()
                } else {
                    let startIndex = s.index(after: index)
                    
                    // 这里需要考虑最后一个是 ）
                    number = solve(String(s[startIndex..<stemp]))
                }
                
            } else if value.isNumber {
                number = number * 10 + Int(value.asciiValue! - Character("0").asciiValue!)
                print(number)
            }
            
            if !value.isNumber || index == s.index(before: s.endIndex) {
                //// 处理符号或者到了最后计算结果
                if asign == "+" {
                    values.push(value: number)
                } else if asign == "-" {
                    values.push(value: -number)
                } else if asign == "*" {
                    if let mlResult = values.pop() {
                        values.push(value: mlResult * number)
                    } else {
                        fatalError()
                    }
                } else if asign == "/" {
                    if let mlResult = values.pop(), number != 0 {
                        values.push(value: mlResult / number)
                    } else {
                        fatalError()
                    }
                }
                // 更新符号
                asign = value
                number = 0
            }
//            print(number)
        }
        
        // 计算
        var result = 0
        while let value = values.pop() {
            result += value
        }
        
        return result
    }
}
//"(2*(3-4))*5"
//"3+2*3*4-1"

//var stem = 0
//for i in sequence(first: 0, next: { $0 < 10 ? $0 + 1 : nil}) {
//    print("\(i)")
////    stem += 2
//}

Solution().solve("3+2*3*4-1")

//let s = "123456"
//var start = s.startIndex
//for i in sequence(first: s.startIndex, next: { $0 < s.endIndex ? s.index(after:start) : nil}) {
//    print(i)
//}
*/

/*
// 编辑距离
// 编辑距离
class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        guard word1.count > 0 else {
            return word2.count
        }
        
        guard word2.count > 0 else {
            return word1.count
        }
        
        let row = word2.count + 1
        let column = word1.count + 1
        
        var result = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: column), count: row)
        
        //result[i][0] 表示 word2 前i个，world1为空
        for i in 0..<row {
            result[i][0] = i
        }
        
        for j in 0..<column {
            result[0][j] = j
        }
        
        for r in 1..<row {
            for c in 1..<column {
                let left = result[r][c - 1] + 1
                var leftTop = result[r - 1][c - 1]
                let top = result[r - 1][c] + 1
                let world1Index = word1.index(word1.startIndex, offsetBy: c - 1)
                let world2Index = word2.index(word2.startIndex, offsetBy: r - 1)
                if word1[world1Index] != word2[world2Index] {
                    leftTop += 1
                }
                result[r][c] = min(left, leftTop, top)
            }
        }
        
        return result[row - 1][column - 1]
    }
    
    func minEditCost1 ( _ word1: String,  _ word2: String,  _ ic: Int,  _ dc: Int,  _ rc: Int) -> Int {
        guard word1.count > 0 else {
            return word2.count * ic
        }
        
        guard word2.count > 0 else {
            return word1.count * dc
        }
        
        let row = word2.count + 1
        let column = word1.count + 1
        
        var result = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: column), count: row)
        
        //result[i][0] 表示 word2 前i个，world1为空
        for i in 0..<row {
            result[i][0] = i * ic
        }
        
        for j in 0..<column {
            result[0][j] = j * dc
        }
        
        // 题目是将s1变成s2
        // 所有的操作都在world1上进行
        for r in 1..<row {
            let world2Index = word2.index(word2.startIndex, offsetBy: r - 1)
            for c in 1..<column {
                let world1Index = word1.index(word1.startIndex, offsetBy: c - 1)
                if word1[world1Index] == word2[world2Index] {
                    result[r][c] = result[r - 1][c - 1]
                } else {
                    // 使用 s1: cb , s2: c举例
                    // c,c -> cb,c, // s1
                    let delete = result[r][c - 1] + dc
                    let replaceMaybe = result[r - 1][c - 1] + rc
                    //cb, 0 -> cb, c; 表示cb全部删除后成为空字符，然后插入c
                    let insert = result[r - 1][c] + ic
                    
                    result[r][c] = min(insert, replaceMaybe, delete)
                }
            }
        }
        
        return result[row - 1][column - 1]
    }
    
    func minEditCost( _ word1: String,  _ word2: String,  _ ic: Int,  _ dc: Int,  _ rc: Int) -> Int {
        guard word1.count > 0 else {
            return word2.count * ic
        }
        
        guard word2.count > 0 else {
            return word1.count * dc
        }
        
        let row = word2.count + 1
        let column = word1.count + 1
        
        var result = Array<Int>(repeating: 0, count: column)
        var leftTopValue = 0
        
        //result[i][0] 表示 word2 前i个，world1为空
        for j in 0..<column {
            result[j] = j * dc
        }
        
        // 题目是将s1变成s2
        // 所有的操作都在world1上进行
        for r in 1..<row {
            let world2Index = word2.index(word2.startIndex, offsetBy: r - 1)
            for c in 1..<column {
                let temp = result[c]
                if c == 1 {
                    leftTopValue = result[0]
                    result[0] = r * ic
                }
                
                let world1Index = word1.index(word1.startIndex, offsetBy: c - 1)
                if word1[world1Index] == word2[world2Index] {
                    result[c] = leftTopValue
                } else {
                    // 使用 s1: cb , s2: c举例
                    // c,c -> cb,c, // s1
                    let delete = result[c - 1] + dc
                    let replaceMaybe = leftTopValue + rc
                    //cb, 0 -> cb, c; 表示cb全部删除后成为空字符，然后插入c
                    let insert = result[c] + ic
                    result[c] = min(insert, replaceMaybe, delete)
                }
                leftTopValue = temp
            }
        }
        
        return result[column - 1]
    }
}
*/

//二叉树根节点到叶子节点的所有路径和
/*
 要求：空间复杂度 O(n)，时间复杂度 O(n^2)
 进阶：空间复杂度 O(n)，时间复杂度 O(n)
 */
/*
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param root TreeNode类
     * @return int整型
     */
    func sumNumbers ( _ root: TreeNode?) -> Int {
        // write code here
        guard let root = root else {
            return 0
        }
        
        var result = 0
        treeNodePath(root: root, current: 0, result: &result)
        
        return result
    }
    
    func treeNodePath(root: TreeNode, current: Int, result: inout Int) {
        let sum = current * 10 + root.val
        guard root.left != nil || root.right != nil else {
            result += sum
            return
        }
        
        if let left = root.left {
            treeNodePath(root: left, current: sum, result: &result)
        }
        
        if let right = root.right {
            treeNodePath(root: right, current: sum, result: &result)
        }
        
    }
}

let tree = TreeNode(1, TreeNode(2), TreeNode(3))
assert(Solution().sumNumbers(tree) == 25)
*/

/*
//二叉树中和为某一值的路径(二)
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param root TreeNode类
     * @param expectNumber int整型
     * @return int整型二维数组
     */
    func FindPath ( _ root: TreeNode?,  _ expectNumber: Int) -> [[Int]] {
        // write code here
        guard let root = root else {
            return []
        }

        var path: [Int] = []
        var result: [[Int]] = []
        treeNodePath(root: root, expectNumber: expectNumber, sum: 0, path: &path, result: &result)
    
        return result
    }
    
    func treeNodePath(root: TreeNode, expectNumber: Int, sum: Int, path: inout [Int], result: inout [[Int]]) {
        path.append(root.val)
        let sum = sum + root.val
        
        if root.left == nil, root.right == nil {
            if sum == expectNumber {
                result.append(path)
            }
            return
        }
        
        if let left = root.left {
            treeNodePath(root: left, expectNumber: expectNumber, sum: sum, path: &path, result: &result)
            path.removeLast()
        }
        
        if let right = root.right {
            treeNodePath(root: right, expectNumber: expectNumber, sum: sum, path: &path, result: &result)
            path.removeLast()
        }
        
    }
}
*/

/*
//链表内指定区间反转
//要求：时间复杂度 O(n) ，空间复杂度 O(n)
//进阶：时间复杂度 O(n)，空间复杂度 O(1)
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param head ListNode类
     * @param m int整型
     * @param n int整型
     * @return ListNode类
     */
    func reverseBetween ( _ head: ListNode?,  _ m: Int,  _ n: Int) -> ListNode? {
        // write code here
        guard head != nil, m <= n, m > 0 else {
            return head
        }
        
        var head = head
        var current = head
        var pre: ListNode? = nil
        var number = 1
        while number < m, let cu = current {
            pre = current
            current = cu.next
            number += 1
        }
        
        var tempHead: ListNode? = nil
        let tempTail = current
        while number <= n, let cu = current {
            current = cu.next
            number += 1
            
            cu.next = nil
            cu.next = tempHead
            tempHead = cu
        }
        
        pre?.next = tempHead
        tempTail?.next = current
        
        // 表示从头点击开始
        if pre == nil {
            head = tempHead
        }
        
        return head
    }
}
*/

/*
 不同路径的数目(一)
 一个机器人在m×n大小的地图的左上角（起点）。
 机器人每次可以向下或向右移动。机器人要到达地图的右下角（终点）。
 可以有多少种不同的路径从起点走到终点？
 
 
 要求：空间复杂度 O(nm)，时间复杂度 O(nm)
 进阶：空间复杂度 O(1)，时间复杂度 O(min(n,m))
*/

/*
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param m int整型
     * @param n int整型
     * @return int整型
     */
    func uniquePaths ( _ m: Int,  _ n: Int) -> Int {
        // write code here
        guard m > 0, n > 0 else {
            return 0
        }
        
        guard m > 1, n > 1 else {
            return 1
        }
        
        // m+n-2步中选择 m-1
        
        var totalStep = m + n - 2
        let rightMoveStep = min(m, n) - 1
        
        var top = 1
        var bottom = 1
        for i in 1...rightMoveStep {
            top *= totalStep
            bottom *= i
            
            totalStep -= 1
        }
        
        return top / bottom
    }
}

let value = Solution().uniquePaths(29, 4)
//assert(value == 6)
*/


public class Interval {
    public var start: Int
    public var end: Int
    public init(_ start: Int = 0, _ end: Int = 0) {
        self.start = start
        self.end = end
    }
}


/*
//合并区间
/*
 要求：空间复杂度 O(n)，时间复杂度 O(nlogn)
 进阶：空间复杂度 O(val)，时间复杂度O(val)
 */
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param intervals Interval类一维数组
     * @return Interval类一维数组
     */
    func merge ( _ intervals: [Interval]) -> [Interval] {
        // write code here
        var intervals = intervals
        intervals.sort { $0.start < $1.start }
        
        var result: [Interval] = []
        for value in intervals {
            if let last = result.last {
                if value.start <= last.end {
                    if value.end > last.end {
                        last.end = value.end
                    }
                } else {
                    result.append(value)
                }
                
            } else {
                result.append(value)
            }
        }
        
        return result
    }
}
*/


/*
// 最长公共子序列(二)
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * longest common subsequence
     * @param s1 string字符串 the string
     * @param s2 string字符串 the string
     * @return string字符串
     */
    
    func LCS( _ s1: String,  _ s2: String) -> String {
        // write code here
        guard !s1.isEmpty, !s2.isEmpty else {
            return "-1"
        }
        
        let row = s1.count + 1
        let column = s2.count + 1
        var result: [[Int]] = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: column), count: row)
        
        let s1Characters = Array(s1)
        let s2Characters = Array(s2)
        
        for r in 1..<row {
            for c in 1..<column {
                if s1Characters[r - 1] == s2Characters[c - 1] {
                    result[r][c] = result[r - 1][c - 1] + 1
                } else {
                    let left = result[r][c - 1]
                    let top = result[r - 1][c]
                    result[r][c] = max(left, top)
                }
            }
        }
        
        var resultString = ""
        var count = result[row - 1][column - 1]
        var r = row - 1
        var c = column - 1
        
        while r > 0, c > 0, count > 0 {
            if s1Characters[r - 1] == s2Characters[c - 1] {
                resultString.append(s1Characters[r - 1])
                count -= 1
                r -= 1
                c -= 1
            } else {
                if result[r][c] == result[r][c - 1] {
                    c -= 1
                } else {
                    r -= 1
                }
            }
        }
        
        return resultString.isEmpty ? "-1" : String(resultString.reversed())
    }
}

Solution().LCS("1A2C3D4B5","B1D23A456A")
*/


/*
// 在两个长度相等的排序数组中找到上中位数
/*
 要求：时间复杂度 O(n)O(n)，空间复杂度 O(1)O(1)
 进阶：时间复杂度为O(logN)O(logN)，空间复杂度为O(1)O(1)
 */
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * find median in two sorted array
     * @param arr1 int整型一维数组 the array1
     * @param arr2 int整型一维数组 the array2
     * @return int整型
     */
    func findMedianinTwoSortedAray ( _ arr1: [Int],  _ arr2: [Int]) -> Int {
        // write code here
        return method2(arr1, arr2)
    }
    
    func method3 ( _ arr1: [Int],  _ arr2: [Int]) -> Int {
        if arr2.count > arr2.count {
            return method3(arr2, arr1)
        }
        
        let m = arr1.count
        let n = arr2.count
        
        var iStart = 0
        var iEnd = m - 1
        var result = 0
        
        while iStart <= iEnd {
            let i = (iStart + iEnd) >> 1
            let j = (m + n + 1) / 2 - i
            let iValue = i >= arr1.count ? Int.max : arr1[i]
            let iPreValue = i > 0 ? arr1[i - 1] : Int.min
            let jValue = j >= arr2.count ? Int.max : arr2[j]
            let jPreValue = j > 0 ? arr2[j - 1] : Int.min
            if iPreValue <= jValue {
                result = max(jPreValue, iPreValue)
                iStart = i + 1
            } else {
                iEnd = i - 1
            }
        }
        
        return result
    }
    
    func method2 ( _ arr1: [Int],  _ arr2: [Int]) -> Int {
        // write code here
        guard arr1.count == arr2.count else {
            return 0
        }
        
        var k = (arr1.count + arr2.count) >> 1
        
        var a1Index = 0
        var a2Index = 0
        var result = 0
        
        while true {
            // 因为数组等长，所以不会出现 index 超出的情况
            if a1Index == arr1.count {
                result = arr2[a2Index + k]
                break
            }
            
            if a2Index == arr2.count {
                result = arr1[a1Index + k]
                break
            }
            
            if k == 1 {
                result = min(arr1[a1Index], arr2[a2Index])
                break
            }
            
            let distance = k / 2 - 1
            let newA1Index = min(a1Index + distance, arr1.count - 1)
            let newA2Index = min(a2Index + distance, arr2.count - 1)
            if arr1[newA1Index] <= arr2[newA2Index] {
                // 排除 a1Index 及之前的元素
                let count = newA1Index - a1Index + 1
                k -= count
                a1Index = newA1Index + 1
            } else {
                let count = newA2Index - a2Index + 1
                k -= count
                a2Index = newA2Index + 1
            }
        }
        
        return result
    }
    
    // O(n)
    func method1 ( _ arr1: [Int],  _ arr2: [Int]) -> Int {
        // write code here
        guard arr1.count == arr2.count else {
            return 0
        }
        
        let finalCount = arr1.count
        var currentCount = 0
        
        var array1Index = 0
        var array2Index = 0
        var value = 0
        while array1Index < arr1.count, array2Index < arr2.count, currentCount < finalCount {
            if arr1[array1Index] <= arr2[array2Index] {
                value = arr1[array1Index]
                array1Index += 1
            } else {
                value = arr2[array2Index]
                array2Index += 1
            }
            currentCount += 1
        }
        
        return value
    }
}

Solution().method3([1],[2,3,4,5,6,7])
*/

/*
// NC60 判断一棵二叉树是否为搜索二叉树和完全二叉树
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param root TreeNode类 the root
     * @return bool布尔型一维数组
     */
    func judgeIt ( _ root: TreeNode?) -> [Bool] {
        // write code here
        guard let root = root else {
            return [true, true]
        }
        
        let isSearch = isSearchTree(root)
        let isComplete = isCompleteTree(root)
        
        return [isSearch, isComplete]
    }
    
    func isSearchTree(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        
//        return searchTree(root).result
        return searchTree2(root, low: Int.min, up: Int.max)

    }
    
    // 判断是是否是二叉搜索树 1
    func searchTree(_ root: TreeNode) -> (result: Bool, min: Int, max: Int) {
        var result = true
        var maxValue = root.val
        var minValue = root.val
        if let left = root.left {
            let leftResult = searchTree(left)
            result = leftResult.result && (root.val > leftResult.max)
            maxValue = max(maxValue, leftResult.max)
            minValue = min(minValue, leftResult.min)
        }
        
        if result, let right = root.right {
            let rightResult = searchTree(right)
            result = rightResult.result && (root.val < rightResult.min)
            maxValue = max(maxValue, rightResult.max)
            minValue = min(minValue, rightResult.min)
        }
        
        return (result, minValue, maxValue)
    }
    
    // 判断是是否是二叉搜索树 2
    func searchTree2(_ root: TreeNode?, low: Int, up: Int) -> Bool {
        guard let root = root else {
            return true
        }
        
        guard root.val >= low, root.val <= up else {
            return false
        }
        
        return searchTree2(root.left, low: low, up: root.val) && searchTree2(root.right, low: root.val, up: up)
        
    }
    
    
    func isCompleteTree(_ root: TreeNode) -> Bool {
        return levelSearch(root: root)
    }
    
    // 1. 层序遍历看最后是否是null
    // 2. 看序号是否相等
    func levelSearch(root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        
        var count = 0
        var maxCode = 0
        
        levelSearch(root: root, index: 1, count: &count, maxCode: &maxCode)
        return count == maxCode
    }
    
    func levelSearch(root: TreeNode?, index: Int, count: inout Int, maxCode: inout Int) {
        guard let root = root else {
            return
        }
        
        count += 1
        maxCode = max(maxCode, index)
        
        levelSearch(root: root.left, index: 2 * index, count: &count, maxCode: &maxCode)
        levelSearch(root: root.right, index: 2 * index + 1, count: &count, maxCode: &maxCode)
    }
    
    
    
    // 我的思路
    func height(of node: TreeNode?) -> (result: Bool, height: Int) {
        guard let nd = node else {
            return (true, 0)
        }
        
        let leftResult = height(of: nd.left)
        let rightResult = height(of: nd.right)
        
        let result = leftResult.result && rightResult.result && leftResult.height >= rightResult.height
        let height = max(leftResult.height, rightResult.height) + 1
        return (result, height)
    }
}
*/

/*
// 删除链表中重复的元素
/*
 要求：空间复杂度 O(n)O(n)，时间复杂度 O(n)O(n)
 进阶：空间复杂度 O(1)O(1)，时间复杂度 O(n)O(n)
 */
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param head ListNode类
     * @return ListNode类
     */
    func deleteDuplicates ( _ head: ListNode?) -> ListNode? {
        // write code here
        guard let head = head else {
            return nil
        }
        
        // 有重复
        var tempHead: ListNode? = head
        if let next = tempHead?.next, next.val == head.val {
            tempHead = next
            while let nxt = tempHead?.next, nxt.val == head.val {
                tempHead = nxt
            }
            return deleteDuplicates(tempHead?.next)
        }
        
        // 不重复
        head.next = deleteDuplicates(head.next)
        return head
    }
}
*/


/*
// 字符串转int
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param s string字符串
     * @return int整型
     */
    func StrToInt ( _ s: String) -> Int {
        // write code here
        guard s.count > 0 else {
            return 0
        }
        
        //1 去除前面的空格
        var startIndex = s.startIndex
        while startIndex < s.endIndex, s[startIndex] == " " {
            startIndex = s.index(after: startIndex)
        }
        
        //2 考虑全部是空格
        guard startIndex < s.endIndex else {
            return 0
        }
        
        //3 考虑正负
        var sign: Int32 = 1
        switch s[startIndex] {
        case "+":
            startIndex = s.index(after: startIndex)
        case "-":
            sign = -1
            startIndex = s.index(after: startIndex)
        default:
            break
        }
        
        //4 开始遍历
        var result: Int32 = 0
        var isOverflow = false
        while startIndex < s.endIndex {
            let isValid = s[startIndex] >= "0" && s[startIndex] <= "9"
            if !isValid {
                break
            }
            
            let value = Int32(s[startIndex].asciiValue! - Character("0").asciiValue!)
            //判断溢出
            if sign == 1, result <= (Int32.max - value) / 10 {
                result = result * 10 + value
            } else if sign == -1, result <= (Int32.min + value) / -10 {
                // 这里要考虑当value = 0, 那么 -(Int32.min + value) 就越界了， 所以 “-”要用于-10
                result = result * 10 + value
            } else {
                //溢出
                isOverflow = true
                break
            }
            
            startIndex = s.index(after: startIndex)
        }
        
        if isOverflow {
            result = sign == -1 ? Int32.min : Int32.max
        } else {
            result = result * sign
        }
        
        return Int(result)
    }
}

Solution().StrToInt(" -0032a12")
*/

/*
//反转数字
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param x int整型
     * @return int整型
     */
    func reverse ( _ x: Int) -> Int {
        // write code here
        var number = x
        var result: Int32 = 0
        
        let isPositive = x >= 0
        
        while number != 0 {
            let value = Int32(number % 10)
            if isPositive, result <= (Int32.max - value) / 10 {
                result = result * 10 + value
            } else if !isPositive, result >= (Int32.min - value) / 10 {
                result = result * 10 + value
            } else {
                result = 0
                break
            }
            number /= 10
        }
        
        return Int(result)
    }
}


Solution().reverse(-1021)
*/

/*
//矩阵元素查找
//空间复杂度 O(1)，时间复杂度 O(n+m)
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param mat int整型二维数组
     * @param n int整型
     * @param m int整型
     * @param x int整型
     * @return int整型一维数组
     */
    func findElement ( _ mat: [[Int]],  _ n: Int,  _ m: Int,  _ x: Int) -> [Int] {
        // write code here
        var row = 0
        var colum = m - 1
        
        var result = [-1, -1]
        while row < n, colum >= 0 {
            let value = mat[row][colum]
            if value > x {
                colum -= 1
            } else if value < x {
                row += 1
            } else {
                result = [row, colum]
                break
            }
        }
        
        return result
    }
}
*/

/*
/**
 缺失的第一个正整数
 进阶： 空间复杂度 O(1)，时间复杂度 O(n)
 */
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param nums int整型一维数组
     * @return int整型
     */
    // ⚠️小于等于0需要被替换成count+1
    func minNumberDisappeared1 ( _ nums: [Int]) -> Int {
        // write code here
        guard nums.count > 0 else {
            return 1
        }
        
        var nums = nums
        let holderValue = nums.count + 1
        for index in 0..<nums.count {
            if nums[index] <= 0 {
                nums[index] = holderValue
            }
        }
        
        for index in 0..<nums.count {
            let value = nums[index]
            let absValue = abs(value)
            //|value| - 1 处于【1，N】，如果不是负数，那么添加-，否则不动
            if absValue > nums.count {
                continue
            }
            if nums[absValue - 1] > 0 {
                nums[absValue - 1] = -nums[absValue - 1]
            }
        }
        
        var result = holderValue
        for index in 0..<nums.count {
            if nums[index] > 0 {
                result = index + 1
                break
            }
        }
        
        return result
    }
    
    // 替换
    func minNumberDisappeared ( _ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 1
        }

        var nums = nums
        for index in 0 ..< nums.count {
            // 防止 nums[i] = x = nums[x-1]
            // nums[nums[index] - 1] != nums[index] 包含了这个判断 nums[index] - 1 ！= index
            while nums[index] > 0, nums[index] - 1 < nums.count, nums[nums[index] - 1] != nums[index] {
                nums.swapAt(index, nums[index] - 1)
            }
        }
        
        var result = nums.count + 1
        for (index, value) in nums.enumerated() {
            if index != value - 1 {
                result = index + 1
                break
            }
        }
        
        return result
    }
}

Solution().minNumberDisappeared([3, 2, 4])
*/

/*
//链表的奇偶重排
//空间复杂度 O(n)，时间复杂度 O(n)
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param head ListNode类
     * @return ListNode类
     */
    func oddEvenList ( _ head: ListNode?) -> ListNode? {
        // write code here
        var oddHeader: ListNode? = nil
        var oddTail: ListNode? = nil
        
        var evenHeader: ListNode? = nil
        var evenTail: ListNode? = nil
        
        var h1 = head
        var h2 = head?.next
        while let h1Node = h1, let h2Node = h2 {
            if oddTail == nil {
                oddHeader = h1Node
            }
            oddTail?.next = h1Node
            oddTail = h1Node
            h1 = h1Node.next?.next
            // 防止循环
            h1Node.next = nil
            
            if evenTail == nil {
                evenHeader = h2Node
            }
            evenTail?.next = h2Node
            evenTail = h2Node
            h2 = h2Node.next?.next
            // 防止循环
            h2Node.next = nil
        }
        
        //考虑只有奇数个node
        if h1 != nil {
            if oddHeader == nil {
                oddHeader = h1
            }
            oddTail?.next = h1
            oddTail = h1
        }
        
        oddTail?.next = evenHeader
        
        return oddHeader
    }
}
*/

/*
// 二叉树的最大路径和
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param root TreeNode类
     * @return int整型
     */
    func maxPathSum ( _ root: TreeNode?) -> Int {
        // write code here
        var max = Int.min
        maxSum(root, maxNodeValue: &max)
        
        return max
    }
    
    func maxSum ( _ root: TreeNode?, maxNodeValue: inout Int) -> Int {
        // write code here
        guard let root = root else {
            return 0
        }
        
        let leftValue = max(maxSum(root.left, maxNodeValue: &maxNodeValue), 0)
        let rightValue = max(maxSum(root.right, maxNodeValue: &maxNodeValue), 0)
        
        let sum = root.val + leftValue + rightValue
        
        if sum > maxNodeValue {
            maxNodeValue = sum
        }
        
        let result = root.val + max(leftValue, rightValue)
        
        return result
    }
}
*/

/*
//对称的二叉树
//空间复杂度 O(n)，时间复杂度 O(n)
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param pRoot TreeNode类
     * @return bool布尔型
     */
    func isSymmetrical ( _ pRoot: TreeNode?) -> Bool {
        // write code here
        guard let pRoot = pRoot else {
            return true
        }
        
        return judge(left: pRoot.left, right: pRoot.right)
    }
    
    func judge(left: TreeNode?, right: TreeNode?) -> Bool {
        guard let left = left else {
            return right == nil
        }
        
        guard let right = right else {
            return false
        }
        
        var result = left.val == right.val
        
        if result {
            result = judge(left: left.left, right: right.right)
        }
        
        if result {
            result = judge(left: left.right, right: right.left)
        }
        
        return result
    }
}
*/

/*
// 括号生成
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param n int整型
     * @return string字符串一维数组
     */
    func generateParenthesis ( _ n: Int) -> [String] {
        // write code here
        var string = ""
        var result: [String] = []
        generate(current: &string, leftCount: n, rightCount: n, result: &result)
        return result
    }
    
    // 剩余的括号数量
    func generate(current: inout String, leftCount: Int, rightCount: Int, result: inout [String]) {
        if leftCount == 0, rightCount == 0 {
            result.append(current)
            return
        }
        
        /**
         什么时候添加左括号
         1. 左括号有剩余
         2. 剩下的左括号等于右括号（使用的左括号>=使用的右括号才有效）
         */
        if leftCount > 0 {
            current.append("(")
            generate(current: &current, leftCount: leftCount - 1, rightCount: rightCount, result: &result)
            current.removeLast()
        }
        
        if rightCount > leftCount {
            current.append(")")
            generate(current: &current, leftCount: leftCount, rightCount: rightCount - 1, result: &result)
            current.removeLast()
        }
    }
}

let s = Solution().generateParenthesis(3)
*/

/*
//顺时针旋转矩阵
/*
 要求：空间复杂度 O(n^2)，时间复杂度 O(n^2)
 进阶：空间复杂度 O(1)，时间复杂度 O(n^2)
 */
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param mat int整型二维数组
     * @param n int整型
     * @return int整型二维数组
     */
    func rotateMatrix ( _ mat: [[Int]],  _ n: Int) -> [[Int]] {
        // write code here
        return advance(mat, n)
    }
    
    func advance( _ mat: [[Int]],  _ n: Int) -> [[Int]] {
        guard !mat.isEmpty else  {
            return mat
        }
        
        var mat = mat
        
        // 水平翻转
        for r in 0 ..< (n / 2) {
            for c in 0 ..< n {
                let temp = mat[n - r - 1][c]
                mat[n - r - 1][c] = mat[r][c]
                mat[r][c] = temp
            }
        }
        
        // 对角线翻转
        for r in 0 ..< (n - 1) {
            for c in (r + 1) ..< n {
                let temp = mat[c][r]
                mat[c][r] = mat[r][c]
                mat[r][c] = temp
            }
        }
        
        return mat
    }
}
*/

/*
//数字字符串转化成IP地址
//"25525522135"
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param s string字符串
     * @return string字符串一维数组
     *
     */
    let maxCount = 4
    func restoreIpAddresses ( _ s: String) -> [String] {
        // write code here
        guard s.count > 3 || s.count <= 12 else {
            return []
        }
        
        var current: [String] = []
        var result: [String] = []
        toIP(s: s, start: s.startIndex, segCount: maxCount, current: &current, result: &result)
        
        return result
    }
    
    func toIP(s: String, start: String.Index, segCount: Int, current: inout [String], result: inout [String]) {
        
        // 过短或刚刚好
        guard start < s.endIndex else {
            if segCount == 0 {
                result.append(current.joined(separator: "."))
            }
            return
        }
        
        //过长
        guard segCount > 0 else {
            return
        }
        
        // ip中间不能有前置0，除非第一个地址
        if s[start] == "0" {
            current.append(String(s[start]))
            toIP(s: s, start: s.index(after: start), segCount: segCount - 1, current: &current, result: &result)
            current.removeLast()
            return
        }
        
        //正常处理
        var value = 0
        let distance = min(s.distance(from: start, to: s.index(before: s.endIndex)), 2)
        for offset in 0 ... distance {
            let idx = s.index(start, offsetBy: offset)
            let val = Int(s[idx].asciiValue! - Character("0").asciiValue!)
            value = value * 10 + val
            if value > 255 {
                break
            } else {
                current.append("\(value)")
                toIP(s: s, start: s.index(after: idx), segCount: segCount - 1, current: &current, result: &result)
                current.removeLast()
            }
        }
        
    }
}

let result = Solution().restoreIpAddresses("25525522135")
*/
/*

//lfu缓存设计
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * lfu design
     * @param operators int整型二维数组 ops
     * @param k int整型 the k
     * @return int整型一维数组
     */
    func LFU ( _ operators: [[Int]],  _ k: Int) -> [Int] {
        // write code here
        guard !operators.isEmpty, k > 0 else {
            return [-1]
        }
        var cache = Solution.LFU<Int, Int>(size: k)
        var result: [Int] = []
        for items in operators {
            if items.count == 3 {
                //set
                cache.set(value: items[2], for: items[1])
            } else {
                //get
                let value = cache.getValue(for: items[1])
                result.append(value ?? -1)
            }
        }
        
        return result
    }
    
    struct LFU<Key: Hashable, Value> {
        
        class Node<T, K> {
            var val: T?
            var key: K?
            var frequency: Int = 1
            var next: Node<T, K>?
            var pre: Node<T, K>?
            init(val: T? = nil, key: K? = nil, pre: Node<T, K>? = nil, next: Node<T, K>? = nil) {
                self.val = val
                self.key = key
                self.pre = pre
                self.next = next
            }
            
            func updateFrequency() {
                frequency += 1
            }
        }
        
        class DoubleList<T, K> {
            // dummy
            let head: Node<T, K> = Node<T, K>()
            let tail: Node<T, K> = Node<T, K>()
            var size = 0
            var isEmpty: Bool {
                return size == 0
            }
            
            init() {
                head.next = tail
                tail.pre = head
            }
            
            func insertAsHeader(node: Node<T, K>) {
                size += 1
                node.next = head.next
                head.next?.pre = node
                
                head.next = node
                node.pre = head
            }
            
            func removeFirst() -> Node<T, K>? {
                guard size > 0 else {
                    return nil
                }
                
                let node = head.next
                remove(node: node)
                
                return node
            }
            
            func removeLast() -> Node<T, K>? {
                print("1")
                guard size > 0 else {
                    return nil
                }
                
                let node = tail.pre
                print("key \(node?.key)")
                remove(node: node)
                print("2")
                return node
            }
            
            func remove(node: Node<T, K>?) {
                guard let node = node, size > 0 else {
                    return
                }
                
                size -= 1
                
                node.pre?.next = node.next
                node.next?.pre = node.pre
                
                node.pre = nil
                node.next = nil
            }
        }
        
        var keyDic: [Key: Node<Value, Key>] = [:]
        var frequentDic: [Int: DoubleList<Value, Key>] = [:]
        let size: Int
        var minFrequent = 1
        
        init(size: Int) {
            self.size = size
        }
        
        mutating
        func getValue(for key: Key) -> Value? {
            guard let node = keyDic[key] else {
                return nil
            }
            
            updateFrequency(node: node)
            return node.val
        }
        
        mutating
        func set(value: Value, for key: Key) {
            // 如果存在，那么表明没有操作size，否则要判断是否超过size
            if let node = keyDic[key] {
                node.val = value
                updateFrequency(node: node)
            } else {
                
                let node = Node(val: value, key: key)
                print("keyDic count: \(keyDic.count) \(frequentDic[minFrequent]?.size)")
                if keyDic.count == size, let list = frequentDic[minFrequent], let nodeRemoved = list.removeLast() {
                    print("dd")
                    if list.isEmpty {
                        //为空
                        frequentDic[minFrequent] = nil
                        // 因为有移除，表明有一个新插入的node，所以最低频率 1
                        
                    }
                    keyDic[nodeRemoved.key!] = nil
                }
                
                // 表明有一个新插入的node，所以最低频率 1
                minFrequent = 1
                
                keyDic[key] = node
                if let list = frequentDic[node.frequency] {
                    list.insertAsHeader(node: node)
                } else {
                    let list = DoubleList<Value, Key>()
                    list.insertAsHeader(node: node)
                    frequentDic[node.frequency] = list
                }
            }
        }
        
        private
        mutating
        func updateFrequency(node: Node<Value, Key>) {
            //升级之前，根据当前的frequent在frequencyDic获取链表
            //抽离当前node
            var needUpdateMinFrequency = false
            
            // 需要判断两个情况
            // 1 node作为对头
            // 2 node作为尾部, 且不止一个元素，一个元素处于 情况1
            // 3 处于中部简单移除
            guard let list = frequentDic[node.frequency] else {
                return
            }
            
            list.remove(node: node)
            if list.isEmpty {
                frequentDic[node.frequency] = nil
                needUpdateMinFrequency = node.frequency == minFrequent
            }
            
            //更新频率
            node.updateFrequency()
            minFrequent = needUpdateMinFrequency ? node.frequency : minFrequent
            if let list = frequentDic[node.frequency] {
                list.insertAsHeader(node: node)
            } else {
                let list = DoubleList<Value, Key>()
                list.insertAsHeader(node: node)
                frequentDic[node.frequency] = list
            }
        }
    }
}

let result = Solution().LFU([[1,1,1],[1,2,2],[1,3,2],[1,2,4],[1,3,5],[2,2],[1,4,4],[2,1]],3)
*/

/*
//重排链表
//进阶：空间复杂度 O(1) ， 时间复杂度 O(n)
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param head ListNode类
     * @return 无
     */
    func reorderList ( _ head: ListNode?) {
        // write code here
        guard let head = head else {
            return
        }
        
        let length = self.length(of: head)
        var moveStep = length / 2
        var needReverseNode: ListNode? = head
        
        while moveStep > 0 {
            needReverseNode = needReverseNode?.next
            moveStep -= 1
        }
        
        // 断链
        let node = needReverseNode?.next
        needReverseNode?.next = nil
        
        //后部分翻转
        let reversedNode = rever(list: node)
        
        //合并
        var firstNode: ListNode? = head
        var secodNode = reversedNode
        
        while let first = firstNode, let second = secodNode {
            firstNode = firstNode?.next
            secodNode = secodNode?.next
            first.next = second
            second.next = firstNode
        }
    }
    
    func length(of list: ListNode) -> Int {
        var length = 1
        var next = list.next
        while next != nil {
            length += 1
            next = next?.next
        }
        
        return length
    }
    
    func rever(list: ListNode?) -> ListNode? {
        var node = list
        var head: ListNode? = nil
        while let nd = node {
            node = node?.next
            nd.next = head
            head = nd
        }
        
        return head
    }
}
 */

/*
// 删除有序链表中重复的元素-I
// 空间复杂度 O(1)，时间复杂度 O(n)
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param head ListNode类
     * @return ListNode类
     */
    
    func deleteDuplicates ( _ head: ListNode?) -> ListNode? {
        var currentNode = head
        while let cur = currentNode {
            while let next = cur.next, next.val == cur.val {
                cur.next = cur.next?.next
            }
            currentNode = currentNode?.next
        }
        
        return head
    }
    
    
    func deleteDuplicates1 ( _ head: ListNode?) -> ListNode? {
        // write code here
        var preNode = head
        var nextNode = preNode?.next
        var head: ListNode? = nil
        var tail: ListNode? = nil
        while let pre = preNode, let next = nextNode {
            if pre.val == next.val {
                preNode = next
                nextNode = nextNode?.next
                pre.next = nil
                
                continue
            }
            
            if head == nil {
                head = pre
            }
            tail?.next = pre
            tail = pre
            
            preNode = next
            nextNode = nextNode?.next
            pre.next = nil
        }
        
        // 考虑只有一个有效node
        if head == nil {
            head = preNode
        }
        tail?.next = preNode
        
        return head
    }
}
*/

/*
// 有重复项数字的全排列
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param num int整型一维数组
     * @return int整型二维数组
     */
    func permuteUnique ( _ num: [Int]) -> [[Int]] {
        // write code here
        guard !num.isEmpty else {
            return []
        }
        
        var result: [[Int]] = []
        var tempArray: [Int] = []
        var visit = Array<Bool>(repeating: false, count: num.count)
//        permute(num: &num, result: &result, startIndex: 0)
        permute(num: num.sorted(), result: &result, visit: &visit, tempArray: &tempArray)
        
        return result
    }
    
    func permute(num: [Int], result: inout [[Int]], visit: inout [Bool], tempArray: inout [Int]) {
        guard tempArray.count < num.count else {
            result.append(tempArray)
            return
        }
        
        for (index, value) in num.enumerated()  {
            if visit[index] {
                continue
            }
            
            // 如果和前面一个值一样，并且visit[index - 1] 为false,表明前一个相同的值被回溯了，所以当前值不用处理（处于同层）
            if index > 0, num[index - 1] == value, !visit[index - 1] {
                continue
            }
            
            visit[index] = true
            tempArray.append(value)
            permute(num: num, result: &result, visit: &visit, tempArray: &tempArray)
            tempArray.removeLast()
            visit[index] = false
        }
    }
    
    //这种做法可以得出结果但是不是按照字典序，但是相比每次交换可以减少循环时间
    func permute1(num: inout [Int], result: inout [[Int]], startIndex: Int) {
        guard startIndex <= num.count - 1 else {
            result.append(num)
            return
        }
        
        for index in startIndex ..< num.count {
            //
            if index == startIndex {
                permute1(num: &num, result: &result, startIndex: startIndex + 1)
                continue
            }
            
            if num[index] == num[index - 1] {
                continue
            }
            
            num.swapAt(startIndex, index)
            permute1(num: &num, result: &result, startIndex: startIndex + 1)
            num.swapAt(startIndex, index)
        }
    }
}

Solution().permuteUnique([1, 2, 1])
*/

/*
//滑动窗口的最大值
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param num int整型一维数组
     * @param size int整型
     * @return int整型一维数组
     */
    func maxInWindows ( _ num: [Int],  _ size: Int) -> [Int] {
        guard !num.isEmpty else {
            return []
        }
        
        
        // write code here
        var queue = Queue<Int>()
        let count = min(num.count, size)
        
        for i in 0 ..< count {
            // 比较队尾队尾，删除队尾
            while let end = queue.end(), num[i] > num[end] {
            queue.removeEnd()
            }
            queue.enqueue(value: i)
        }
        
        var result: [Int] = []
        if let index = queue.front() {
            result.append(num[index])
        }
        
        guard size < num.count else {
            return result
        }
        
        for i in size ..< num.count {
            while let end = queue.end(), num[i] > num[end] {
                queue.removeEnd()
            }
            
            if let front = queue.front(), i - front == size {
                queue.dequeue()
            }
            
            queue.enqueue(value: i)
            
            if let index = queue.front() {
                result.append(num[index])
            }
        }
        
        return result
    }
}
Solution().maxInWindows([2,3,4,2,6,2,5,1],3)
*/

/*
// 二叉树中和为某一值的路径(一)
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param root TreeNode类
     * @param sum int整型
     * @return bool布尔型
     */
    func hasPathSum ( _ root: TreeNode?,  _ sum: Int) -> Bool {
        // write code here
        guard let root = root else {
            return false
        }

        return havePath(root, sum: sum, currenSum: 0)
    }
    
    func havePath(_ root: TreeNode?, sum: Int, currenSum: Int) -> Bool {
        guard let root = root else {
            return false
        }
        
        let isLeaf = root.left == nil && root.right == nil
        let result = isLeaf && currenSum + root.val == sum
        
        return result || havePath(root.left, sum: sum, currenSum: currenSum + root.val) || havePath(root.right, sum: sum, currenSum: currenSum + root.val)
    }
}
*/


/*
// 加起来和为目标值的组合(二)
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param num int整型一维数组
     * @param target int整型
     * @return int整型二维数组
     */
    func combinationSum2 ( _ num: [Int],  _ target: Int) -> [[Int]] {
        // write code here
        var tempArray: [Int] = []
        var result: [[Int]] = []
        let num = num.sorted()
        combinate(num: num, tempArray: &tempArray, result: &result, startIndex: 0, remain: target)
        
        return result
    }
    
    private
    func combinate(num: [Int], tempArray: inout [Int], result: inout [[Int]], startIndex: Int, remain: Int) {
        
        if remain == 0 {
            result.append(tempArray)
            return
        }
        
        for i in startIndex ..< num.count {
            if num[i] > remain {
                break
            }
            
            //去重
            if i > startIndex, num[i] == num[i - 1] {
                continue
            }
            
            let rem =  remain - num[i]
            tempArray.append(num[i])
            combinate(num: num, tempArray: &tempArray, result: &result, startIndex: i + 1, remain: rem)
            tempArray.removeLast()
        }
    }
}

Solution().combinationSum2([2],1)
*/


/*
 最长的括号子串
 要求时间复杂度 O(n) ,空间复杂度 O(n).
 参考：https://leetcode-cn.com/problems/longest-valid-parentheses/solution/zui-chang-you-xiao-gua-hao-by-leetcode-solution/
 */
/*
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param s string字符串
     * @return int整型
     */
    func longestValidParentheses ( _ s: String) -> Int {
        // write code here
        return solutionUsingDp(s)
    }
    
    func solutionUsingDp(_ s: String) -> Int {
        /*
         dp[i] 表示以下标 i 字符结尾的最长有效括号的长度。
         '('为0
         转移公式
         当s[i] = ')' s[i-1] = "(" => dp[i] = dp[i-2] + 2
         当s[i] = ')' s[i-1] = ")", s[i - dp[i-1] -1] = "(" => dp[i] = dp[i - 1] + 2 + dp[i - dp[i-1] - 2]
         */
        let s = Array(s)
        var maxLength = 0
        var dp = Array<Int>(repeating: 0, count: s.count)
        
        for (index, value) in s.enumerated() {
            let isValidMaybe = value == Character(")") && index > 0
            if isValidMaybe {
                if s[index - 1] == Character("(") {
                    dp[index] = dp[max(0, index - 2)] + 2
                    maxLength = max(maxLength, dp[index])
                } else if s[index - 1] == Character(")") {
                    let preIndex = index - dp[index - 1] - 1
                    if preIndex >= 0, s[preIndex] == Character("(") {
                        dp[index] = dp[index - 1] + 2 + dp[max(0, preIndex - 1)]
                        maxLength = max(maxLength, dp[index])
                    }
                }
            }
        }
        
        return maxLength
    }
    
    /*
     使用栈
     时间复杂度O(N)
     空间复杂度O(N)
     */
    func solutionUsingStack(_ s: String) -> Int {
        var stack = Stack<Int>()
        stack.push(value: -1)
        var maxLength = 0
        
        for (index, value) in s.enumerated() {
            if value == Character("(") {
                stack.push(value: index)
            } else {
                stack.pop()
                if stack.isEmpty {
                    stack.push(value: index)
                } else {
                    if let peek = stack.peek() {
                        maxLength = max(maxLength, index - peek)
                    }
                }
            }
        }
        
        return maxLength
    }
    
    /*
     贪心算法
     时间复杂度O(N)
     空间复杂度O(1)
     */
    func solutionUsingGreedy(_ s: String) -> Int {
        var maxLength = 0
        
        // 左到右
        var leftCount = 0
        var rightCount = 0
        for value in s {
            if value == Character("(") {
                leftCount += 1
            } else {
                rightCount += 1
            }
            
            if leftCount == rightCount {
                maxLength = max(leftCount + rightCount, maxLength)
            } else if rightCount > leftCount {
                leftCount = 0
                rightCount = 0
            }
        }
        
        // 右到左
        leftCount = 0
        rightCount = 0
        
        for value in s.reversed() {
            if value == Character("(") {
                leftCount += 1
            } else {
                rightCount += 1
            }
            
            if leftCount == rightCount {
                maxLength = max(leftCount + rightCount, maxLength)
            } else if leftCount > rightCount {
                leftCount = 0
                rightCount = 0
            }
        }
        
        return maxLength
    }
}
*/

/*
// 最长公共前缀
// 进阶：空间复杂度 O(n)，时间复杂度 O(n)
// ["abca","abc","abca","abc","abcc"]
// "abc"
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param strs string字符串一维数组
     * @return string字符串
     */
    func longestCommonPrefix ( _ strs: [String]) -> String {
        return zongxiang(strs)
    }
    
    // 纵向
    func zongxiang( _ strs: [String]) -> String {
        guard !strs.isEmpty else {
            return ""
        }
        
        let result = strs[0]
        
        for colum in 0 ..< result.count {
            let firstIndex = result.index(result.startIndex, offsetBy: colum)
            let val = result[firstIndex]
            for row in 1 ..< strs.count {
                let item = strs[row]
                if colum == item.count || item[item.index(item.startIndex, offsetBy: colum)] != val {
                    return String(result[..<firstIndex])
                }
            }
        }
        
        return result
    }
    
    // 横向
    func hengxiang( _ strs: [String]) -> String {
        // write code here
        guard !strs.isEmpty else {
            return ""
        }
        
        var result = Array(strs[0])
        
        for index in 1 ..< strs.count {
            let value = Array(strs[index])
            
            // 对比
            let count = min(result.count, value.count)
            var i = 0
            while i < count, result[i] == value[i] {
                i += 1
            }
            
            result.removeSubrange(i ..< result.count)
        }
        
        return String(result)
    }
}

Solution().longestCommonPrefix(["abca", "n"])
*/

/*
//二分查找-II
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * 如果目标值存在返回下标，否则返回 -1
     * @param nums int整型一维数组
     * @param target int整型
     * @return int整型
     */
    func search ( _ nums: [Int],  _ target: Int) -> Int {
        // write code here
        guard !nums.isEmpty else {
            return -1
        }
//        return find(value: target, in: nums, start: 0, end: nums.count - 1)
        var left = 0
        var right = nums.count - 1
        while left < right {
            let middle = (left + right) >> 1
            if nums[middle] >= target {
                right = middle
            } else {
                left = middle + 1
            }
        }
        
        return nums[left] == target ? left : -1
    }
    
    private
    func find(value: Int, in nums: [Int], start: Int, end: Int) -> Int {
        guard start >= 0, end < nums.count, start <= end, nums[start] <= value,  nums[end] >= value else {
            return -1
        }
        
        let middle = (start + end) >> 1
        let middleValue = nums[middle]
        var result = -1
        if middleValue < value {
            result = find(value: value, in: nums, start: middle + 1, end: end)
        } else if middleValue > value {
            result = find(value: value, in: nums, start: start, end: middle - 1)
        } else {
            // 相等
            var index = middle
            while index >= 0, nums[index] == value {
                index -= 1
            }
            result = index + 1
        }
        
        return result
    }
}

Solution().search([1,1,1,1,1],1)
*/

/*
//丢棋子问题
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * 返回最差情况下扔棋子的最小次数
     * @param n int整型 楼层数
     * @param k int整型 棋子数
     * @return int整型
     */
    func solve ( _ n: Int,  _ k: Int) -> Int {
        // write code here
        
        guard n > 1 else {
            return 1
        }
        
        var dp = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: k + 1), count: n + 1)
        
        for i in 1 ... k {
            dp[1][i] = 1
        }
        
        var result = -1
        for i in 2 ... n {
            for j in 1 ... k {
                dp[i][j] = 1 + dp[i - 1][j] + dp[i - 1][j - 1]
            }
            if dp[i][k] >= n {
                result = i
                break
            }
        }
        
        return result
    }
}
*/

/*
//序列化二叉树
// 陷阱1.因为构成的不是满二叉树，所以反序列化不能使用所以不能使用 left = root * 2 + 1, right = root * 2 + 2
// 陷阱2：node.val 不只是 0-9，考虑的 >=10 的值在字符串中还原，所以要插入分隔符
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param root TreeNode类
     * @return TreeNode类
     */
    
    func Serialize ( _ root: TreeNode?) -> String {
        var result = ""
        serializeFunc(node: root, result: &result)
        return result
    }
    
    func serializeFunc(node: TreeNode?, result: inout String) {
        guard let node = node else {
            result.append("#,")
            return
        }
        
        result.append("\(node.val),")
        serializeFunc(node: node.left, result: &result)
        serializeFunc(node: node.right, result: &result)
    }
    
    func Deserialize ( _ str: String) -> TreeNode? {
        let s = str.split(separator: Character(","))
        var index = 0
        return deserializeFunc(s, index: &index)
    }
    
    func deserializeFunc( _ strArray: [Substring], index: inout Int) -> TreeNode? {
        guard index < strArray.count, let value = Int(strArray[index]) else {
            index += 1
            return nil
        }
        
        let node = TreeNode(value)
        index += 1
        node.left = deserializeFunc(strArray, index: &index)
        node.right = deserializeFunc(strArray, index: &index)
        
        return node
    }
    
    func Serialize1 ( _ root: TreeNode?) -> String {
        // write code here
        guard let root = root else {
            return ""
        }

        var nodeQueue = Queue<TreeNode?>()
        nodeQueue.enqueue(value: root)
        var result = ""

        
        while !nodeQueue.isEmpty {
            if let node = nodeQueue.dequeue() ?? nil {
                result.append("\(node.val),")
                nodeQueue.enqueue(value: node.left)
                nodeQueue.enqueue(value: node.right)
            } else {
                result.append("#,")
            }
        }
        
        return result
    }
    
    // 序列化的不是满二叉树，所以不能使用 left = root * 2 + 1, right = root * 2 + 2
    func Deserialize1 ( _ str: String) -> TreeNode? {
        // write code here
        guard !str.isEmpty else {
            return nil
        }
        
        let s = str.split(separator: Character(","))
        let root = TreeNode(Int(s[0])!)
        var queue = Queue<TreeNode>()
        queue.enqueue(value: root)
        
        var index = 1
        while index < s.count, let node = queue.dequeue() {
            if let val = Int(s[index]) {
                let left = TreeNode(val)
                node.left = left
                queue.enqueue(value: left)
            }
            
            index += 1
            if index >= s.count {
                break
            }
            
            if let val = Int(s[index]) {
                let right = TreeNode(val)
                node.right = right
                queue.enqueue(value: right)
            }
            index += 1
        }
        
        return root
    }
}

let node = TreeNode(5, TreeNode(4, TreeNode(3, TreeNode(2))))
let res = Solution().Serialize(node)
Solution().Deserialize(res)
//"12,13,#".split(separator: Character(","))
*/

/*
//二叉搜索树的第k个节点
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param proot TreeNode类
     * @param k int整型
     * @return int整型
     */
    
    func KthNode ( _ proot: TreeNode?,  _ k: Int) -> Int {
        // write code here
        guard let proot = proot else {
            return -1
        }
        var k = k
        return inOrder(root: proot, k: &k)?.val ?? -1
    }
    
    func inOrder(root: TreeNode?, k: inout Int) -> TreeNode? {
        guard let r = root else {
            return nil
        }
        
        var target = inOrder(root: r.left, k: &k)
        if target == nil {
            k -= 1
            if k == 0 {
                target = r
            }
        }
        
        if target == nil {
            target = inOrder(root: r.right, k: &k)
        }
        
        return target
    }
}
*/

/*
//字符串变形
// 陷阱1：单词需要翻转还原
// 陷阱2：翻转过程中不能改变大小写（翻转会使用2次）
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param s string字符串
     * @param n int整型
     * @return string字符串
     */
    func trans ( _ s: String,  _ n: Int) -> String {
        guard !s.isEmpty else {
            return ""
        }
        // write code here
        var array = Array(s).map { $0.isUppercase ? Character($0.lowercased()) : Character($0.uppercased())}
        reverse(str: &array, start: 0, end: array.count - 1)
        
        var start = 0
        var end = 0
        while end < array.count {
            if array[end].isWhitespace {
                reverse(str: &array, start: start, end: end - 1)
                start = end + 1
            } else if end == array.count - 1 {
                reverse(str: &array, start: start, end: end)
            }
            end += 1
        }
        return String(array)
    }
    
    func reverse(str: inout [Character], start: Int, end: Int) {
        var start = start
        var end = end
        while start < end {
            str.swapAt(start, end)
            start += 1
            end -= 1
        }
    }
}

Solution().trans("Hello World", 7)
*/
/*
//数组中的最长连续子序列
// 陷阱1：重复元素
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * max increasing subsequence
     * @param arr int整型一维数组 the array
     * @return int整型
     */
    func MLS ( _ arr: [Int]) -> Int {
        // write code here
        guard !arr.isEmpty else {
            return 0
        }
        var values = arr
        fastSort(arr: &values, start: 0, end: arr.count - 1)
        print(values)
        
        var result = 1
        var maxValue = 1
        for index in 1 ..< values.count {
            // 这里要处理重复元素,
            if values[index] == values[index - 1] {
                continue
            }
            
            if values[index] - 1 == values[index - 1] {
                result += 1
                maxValue = max(result, maxValue)
                continue
            }
            result = 1
        }
        
        return maxValue
    }
    
    func fastSort(arr: inout [Int], start: Int, end: Int) {
        guard start >= 0, end < arr.count, start < end else {
            return
        }
        
        let privot = arr[end]
        var index = start - 1
        for i in start ..< end {
            if arr[i] <= privot {
                index += 1
                arr.swapAt(index, i)
            }
        }
        index += 1
        arr.swapAt(index, end)
        
        fastSort(arr: &arr, start: start, end: index - 1)
        fastSort(arr: &arr, start: index + 1, end: end)
    }
}
*/

/*
//环形链表的约瑟夫问题
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param n int整型
     * @param m int整型
     * @return int整型
     */
    
    func ysf ( _ n: Int,  _ m: Int) -> Int {
        // write code here
        guard n > 0 else {
            return -1
        }
        var result = 0
        for i in 2 ... n {
            result = (result + m) % i
        }
        
        return result + 1
    }
}

Solution().ysf(5, 2)
*/

/*
//最大数
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * 最大数
     * @param nums int整型一维数组
     * @return string字符串
     */
    func solve ( _ nums: [Int]) -> String {
        // write code here
        guard !nums.isEmpty else {
            return ""
        }
        
        var nums = nums
        fastSort(nums: &nums, start: 0, end: nums.count - 1)
        
        //排除全为0
        if nums[0] == 0 {
            return "0"
        }
        
        return nums.reduce("") { $0.appending("\($1)") }
    }
    
    func fastSort(nums: inout [Int], start: Int, end: Int) {
        guard start >= 0, end < nums.count, start < end else {
            return
        }
        
        let pivot = nums[end]
        var index = start - 1
        
        var sy = 10
        while sy <= pivot {
            sy *= 10
        }
        
        
        for i in start ..< end {
//            let first = "\(nums[i])\(pivot)"
//            let secod = "\(pivot)\(nums[i])"
            
            var sx = 10
            while sx <= nums[i] {
                sx *= 10
            }
            
            let first = nums[i] * sy + pivot
            let secod = pivot * sx + nums[i]
            
            if first >= secod {
                index += 1
                nums.swapAt(index, i)
            }
        }
        
        index += 1
        nums.swapAt(index, end)
        
        fastSort(nums: &nums, start: start, end: index - 1)
        fastSort(nums: &nums, start: index + 1, end: end)
    }
}

Solution().solve([2,20,23,4,8])
*/

/*
//多叉树的直径
struct Edge {
    let end: Int
    let weight: Int
}
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * 树的直径
     * @param n int整型 树的节点个数
     * @param Tree_edge Interval类一维数组 树的边
     * @param Edge_value int整型一维数组 边的权值
     * @return int整型
     */
    func solve ( _ n: Int,  _ Tree_edge: [Interval],  _ Edge_value: [Int]) -> Int {
        // write code here
        guard !Tree_edge.isEmpty, Edge_value.count == Edge_value.count, n > 0 else {
            return 0
        }
        
        let graph = createGraph(n, Tree_edge, Edge_value)
        var temp: (end: Int, path: Int) = (0, 0)
        dfs(graph: graph, from: 0, pre: -1, path: 0, result: &temp)
        print(temp)
        var result = (end: 0, path: 0)
        dfs(graph: graph, from: temp.end, pre: -1, path: 0, result: &result)
        
        return result.path
    }
    
    private
    func createGraph(_ n: Int, _ treeEdge: [Interval], _ edgeValue: [Int]) -> [Int: [Edge]] {
        var graph: [Int: [Edge]] = [:]
        for index in 0 ..< treeEdge.count {
            let value = treeEdge[index]
            if graph[value.start] == nil {
                graph[value.start] = []
            }
            let edge1 = Edge(end: value.end, weight: edgeValue[index])
            graph[value.start]?.append(edge1)
            
            if graph[value.end] == nil {
                graph[value.end] = []
            }
            let edge2 = Edge(end: value.start, weight: edgeValue[index])
            graph[value.end]?.append(edge2)
        }
        
        return graph
    }

    private
    func dfs(graph: [Int: [Edge]], from: Int, pre: Int, path: Int, result: inout (end: Int, path: Int)) {
        guard let edges = graph[from] else {
            return
        }
        
        for edge in edges where edge.end != pre {
            let path = path + edge.weight
            if path > result.path {
                result.end = edge.end
                result.path = path
            }
            dfs(graph: graph, from: edge.end, pre: from, path: path, result: &result)
        }
    }
}

//Solution().solve(6,[[0,1],[1,5],[1,2],[2,3],[2,4]],[3,4,2,1,5])
*/

/*
//验证IP地址
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * 验证IP地址
     * @param IP string字符串 一个IP地址字符串
     * @return string字符串
     */
    func solve ( _ IP: String) -> String {
        // write code here
        if isIPV4(IP) {
            return "IPv4"
        } else if isIPV6(IP) {
            return "IPv6"
        } else {
            return "Neither"
        }
    }
    
    private
    func isIPV4(_ ip: String) -> Bool {
        let group = ip.split(separator: ".", omittingEmptySubsequences: false)
        guard group.count == 4 else {
            return false
        }
        
        for element in group {
            // 两点之间没有数字 | 首数字为0 | 位数大于3
            if element.count == 0 || (element.count > 0 && element[element.startIndex] == "0" ) || element.count > 3 {
                return false
            }
            
            if let value = Int(element), value >= 0, value <= 255 {
                continue
            }
            return false
        }
        
        return true
    }
    
    private
    func isIPV6(_ ip: String) -> Bool {
        let group = ip.split(separator: ":", omittingEmptySubsequences: false)
        guard group.count == 8 else {
            return false
        }
        
        for item in group {
            // 大于4个字符
            guard item.count == 4 || item.count == 1 else {
                return false
            }
            
            guard item != "0000" else {
                return false
            }
            
            for c in item {
                if (c >= "0" && c <= "9") || (c >= "a" && c <= "f") || (c >= "A" && c <= "F")  {
                    continue
                }
                return false
            }
        }
        
        return true
    }
}

//Solution().solve("2001:0db8:85a3:0:0:8A2E:0370:7334:")
//"2001:0db8:85a3:0:0:8A2E::0370:7334".split(separator: ":", omittingEmptySubsequences: false)
"".count
*/

/*
// 大数乘法
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param s string字符串 第一个整数
     * @param t string字符串 第二个整数
     * @return string字符串
     */
    func solve ( _ s: String,  _ t: String) -> String {
        // write code here
        guard s != "0", t != "0" else {
            return "0"
        }
        
        var result = Array<Character>(repeating: "0", count: s.count + t.count)
        let sArray = Array(s)
        let tArray = Array(t)
        
        for sIndex in stride(from: sArray.count - 1, through: 0, by: -1) {
            let sValue = Int(String(sArray[sIndex]))!
            for tIndex in stride(from: tArray.count - 1, through: 0, by: -1) {
                let tValue = Int(String(tArray[tIndex]))!
                var multipleValue = sValue * tValue
                var index = sIndex + tIndex + 1
                
                while multipleValue > 0 {
                    let preValue = Int(String(result[index]))!
                    let remain = multipleValue % 10
                    var tempResult = preValue + remain
                    let carry = tempResult / 10
                    tempResult %= 10
                    
                    result[index] = Character("\(tempResult)")
                    
                    // index往前移动
                    index -= 1
                    multipleValue = multipleValue / 10 + carry
                }
            }
        }
        
        return result[0] == "0" ? String(result[1..<result.count]) : String(result)
    }
}

Solution().solve("11", "99")
*/

/*
//集合的所有子集(一)
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param S int整型一维数组
     * @return int整型二维数组
     */
    
    func subsets ( _ S: [Int]) -> [[Int]] {
        guard !S.isEmpty else {
            return []
        }
        
        let sArray = S.sorted()
        var result: [[Int]] = []
        var tempArray: [Int] = []
        
        getSubSet(sArray, index: 0, tempArray: &tempArray, result: &result)
        
        return result
    }
    
    private
    func getSubSet(_ s: [Int], index: Int, tempArray: inout [Int], result: inout [[Int]]) {
        // 这表示没有加入
        result.append(tempArray)
        
        //这表示加入
        for i in index ..< s.count {
            tempArray.append(s[i])
            getSubSet(s, index: i + 1, tempArray: &tempArray, result: &result)
            tempArray.removeLast()
        }
    }
    
    
    func subsets1 ( _ S: [Int]) -> [[Int]] {
        // write code here
        guard !S.isEmpty else {
            return []
        }
        let sArray = S.sorted()
        var result: [[Int]] = []
        var tempArray: [Int] = []
        getSubSet1(sArray, index: 0, tempArray: &tempArray, result: &result)
        
        return result
    }
    
    private
    func getSubSet1(_ s: [Int],index: Int, tempArray: inout [Int], result: inout [[Int]]) {
        guard index < s.count else {
            result.append(tempArray)
            return
        }
        
        // 不加入
        getSubSet1(s, index: index + 1, tempArray: &tempArray, result: &result)
        
        //加入
        tempArray.append(s[index])
        getSubSet1(s, index: index + 1, tempArray: &tempArray, result: &result)
        //回溯
        tempArray.removeLast()
    }
}

Solution().subsets([1,2,3])
*/
/*
//没有重复项数字的全排列
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param num int整型一维数组
     * @return int整型二维数组
     */
    func permute ( _ num: [Int]) -> [[Int]] {
        // write code here
        var num = num
        var result: [[Int]] = []
        permute(num: &num, result: &result, startIndex: 0)
        
        return result
    }
    
    private
    func permute(num: inout [Int], result: inout [[Int]], startIndex: Int) {
        guard startIndex < num.count - 1 else {
            result.append(num)
            return
        }
        
        for i in startIndex ..< num.count {
            num.swapAt(i, startIndex)
            permute(num: &num, result: &result, startIndex: startIndex + 1)
            num.swapAt(i, startIndex)
        }
    }
}


Solution().permute([1, 2, 3])
*/

/*
//链表中倒数最后k个结点
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param pHead ListNode类
     * @param k int整型
     * @return ListNode类
     */
    func FindKthToTail ( _ pHead: ListNode?,  _ k: Int) -> ListNode? {
        // write code here
        guard let pHead = pHead, k > 0 else {
            return nil
        }
        
        
        var slow: ListNode? = pHead
        var fast: ListNode? = pHead
        var k = k
        while k > 1, fast != nil {
            fast = fast?.next
            k -= 1
        }
        
        // 是否k过大
        if fast == nil {
            return nil
        }
        
        while let next = fast?.next {
            slow = slow?.next
            fast = next
        }
        
        return slow
    }
}
*/

/*
//兑换零钱(一)
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * 最少货币数
     * @param arr int整型一维数组 the array
     * @param aim int整型 the target
     * @return int整型
     */
    
    // round 2
    // 1. max = aim + 1
    // 2. dp[0] = 0
    // 3. 注意 ... 越界
    func minMoney ( _ arr: [Int],  _ aim: Int) -> Int {
        guard aim > 0 else {
            return 0
        }
        
        let max = aim + 1
        var dp = Array<Int>(repeating: max, count: max)
        dp[0] = 0
        for a in 1 ... aim {
            for c in arr where c <= a {
                dp[a] = min(dp[a], dp[a - c] + 1)
            }
        }
        
        return dp[aim] > aim ? -1 : dp[aim]
    }
    
    // round1
    func minMoney1 ( _ arr: [Int],  _ aim: Int) -> Int {
        // write code here
        guard arr.count > 0 else {
            return -1
        }
        var dp = Array<Int>(repeating: 0, count: aim + 1)
        let minValue = arr.min()!
        for i in 1 ..< minValue {
            dp[i] = -1
        }
        
        for v in arr where v <= aim {
            dp[v] = 1
        }
        
        money(arr: arr, aim: aim, min: minValue, dp: &dp)
        
        return dp[aim]
    }
    
    private
    func money(arr: [Int], aim: Int, min: Int, dp: inout [Int]) -> Int {
        guard aim >= min, dp[aim] != -1 else {
            return -1
        }
        
        if dp[aim] > 0 || aim == 0 {
            return dp[aim]
        }
        
        var minValue = Int.max
        for v in arr where v <= aim {
            let value = money(arr: arr, aim: aim - v , min: min, dp: &dp)
            if value != -1 {
                minValue = Swift.min(minValue, value)
            }
        }
        
        dp[aim] = minValue == Int.max ? -1 : minValue + 1
        
        return dp[aim]
    }
}

Solution().minMoney([5, 2, 3], 0)
*/
/*
// 寻找峰值
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param nums int整型一维数组
     * @return int整型
     */
    func findPeakElement ( _ nums: [Int]) -> Int {
        // write code here
        guard nums.count > 0 else {
            return -1
        }
        
        var left = 0
        var right = nums.count - 1
        
        var result = 0
        
        while left <= right {
            let middle = (left + right) >> 1
            let middleValue = nums[middle]
            let preValue = middle == 0 ? Int.min : nums[middle - 1]
            let afterValue = middle == nums.count - 1 ? Int.min : nums[middle + 1]
            print(middle, preValue, afterValue)
            
            if middleValue > preValue, middleValue > afterValue {
                result = middle
                break
            }
            if preValue > middleValue {
                right = middle - 1
            } else {
                left = middle + 1
            }
        }
        
        return result
    }
    
    private
    func findPeak(in nums: [Int], start: Int, end: Int) -> Int {
        
        let middle = (start + end) >> 1
        let middleValue = nums[middle]
        let preValue = middle - 1 == -1 ? Int.min : nums[middle - 1]
        let afterValue = middle + 1 == nums.count ? Int.min : nums[middle + 1]
        if middleValue > preValue, middleValue > afterValue {
            return middle
        }
        
        if preValue > middleValue {
            return findPeak(in: nums, start: start, end: middle - 1)
        } else if afterValue > middle {
            return findPeak(in: nums, start: middle + 1, end: end)
        }
        
        return 0
    }
}

Solution().findPeakElement([2,4,6])
*/

/*
//最小覆盖子串
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param S string字符串
     * @param T string字符串
     * @return string字符串
     */
    
    // key: charactor, value: 出现次数
    var need: [Character: Int] = [:]
    var current: [Character: Int] = [:]
    
    // 优化
    func minWindow ( _ S: String,  _ T: String) -> String {
        // write code here
        guard S.count >= T.count else {
            return ""
        }
        
        //记录t中原生以及个数
        for t in T {
            if need[t] == nil {
                need[t] = 0
            }
            need[t] = need[t]! + 1
        }
        
        var filterS: [(index: Int, value: Character)] = []
        let sArray = Array(S)
        for (index, value) in sArray.enumerated() {
            if need[value] != nil {
                filterS.append((index, value))
            }
        }
        
        //滑窗左边界
        var left = 0
        //滑窗有边界
        var right = 0
        
        //当前已经寻找的子串的长度
        var currentResultLength = Int.max
        //当前已经寻找的子串的左边界
        var resultL = -1
        //当前已经寻找的子串的右边界
        var resultR = -1
        
        while right < filterS.count {
            //如果处在r的元素是t中的元素，那么记录
            if need[filterS[right].value] != nil {
                if current[filterS[right].value] == nil {
                    current[filterS[right].value] = 0
                }
                current[filterS[right].value] = current[filterS[right].value]! + 1
            }
            
            //这里判断是否当前的窗口已经包含了所有T中的元素
            //如果包含了，那么就开始缩小滑窗
            //否则继续扩大滑窗
            while check() && left <= right {
                //判断当前滑窗是否是最小的子串
                let leftIndex = filterS[left].index
                let rightIndex = filterS[right].index
                let length = rightIndex - leftIndex + 1
                if length < currentResultLength {
                    currentResultLength = length
                    resultL = leftIndex
                    resultR = rightIndex
                }
                //缩小left,同时查看left的元素移除，是否要更新current字典
                if let count = current[filterS[left].value] {
                    current[filterS[left].value] = count - 1
                }
                
                left += 1
            }
            
            right += 1
        }
        
        return resultL == -1 ? "" : String(sArray[resultL...resultR])
        
    }
    
    
    func minWindow1 ( _ S: String,  _ T: String) -> String {
        // write code here
        guard S.count >= T.count else {
            return ""
        }
        
        //记录t中原生以及个数
        for t in T {
            if need[t] == nil {
                need[t] = 0
            }
            need[t] = need[t]! + 1
        }
        
        //滑窗左边界
        var left = 0
        //滑窗有边界
        var right = 0
        
        //当前已经寻找的子串的长度
        var currentResultLength = Int.max
        //当前已经寻找的子串的左边界
        var resultL = -1
        //当前已经寻找的子串的右边界
        var resultR = -1
        
        let sArray = Array(S)
        
        while right < sArray.count {
            //如果处在r的元素是t中的元素，那么记录
            if need[sArray[right]] != nil {
                if current[sArray[right]] == nil {
                    current[sArray[right]] = 0
                }
                current[sArray[right]] = current[sArray[right]]! + 1
            }
            
            //这里判断是否当前的窗口已经包含了所有T中的元素
            //如果包含了，那么就开始缩小滑窗
            //否则继续扩大滑窗
            while check() && left <= right {
                //判断当前滑窗是否是最小的子串
                let length = right - left + 1
                if length < currentResultLength {
                    currentResultLength = length
                    resultL = left
                    resultR = right
                }
                //缩小left,同时查看left的元素移除，是否要更新current字典
                if let count = current[sArray[left]] {
                    current[sArray[left]] = count - 1
                }
                
                left += 1
            }
            
            right += 1
        }
        
        return resultL == -1 ? "" : String(sArray[resultL...resultR])
    }
    
    private
    func check() -> Bool {
        var result = true
        for (key, value) in need {
            if let count = current[key], count >= value {
                continue
            }
            result = false
            break
        }
        
        return result
    }
    
}
Solution().minWindow("XDOYEZODEYXNZ", "XYZ")
*/

/*
//二维数组中的查找
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param target int整型
     * @param array int整型二维数组
     * @return bool布尔型
     */
    func Find ( _ target: Int,  _ array: [[Int]]) -> Bool {
        // write code here
        guard !array.isEmpty else {
            return false
        }
        
        var row = 0
        var column = array[0].count - 1
        var result = false
        
        while row < array.count, column >= 0 {
            let value = array[row][column]
            
            if target > value {
                row += 1
            } else if target < value {
                column -= 1
            } else {
                result = true
                break
            }
        }
        
        return result
    }
}

Solution().Find(7,[[1,2,8,9],[2,4,9,12],[4,7,10,13],[6,8,11,15]])
*/

/*
//数组中的逆序对
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param data int整型一维数组
     * @return int整型
     */
    
    let mod = 1000000007
    func InversePairs ( _ data: [Int]) -> Int {
        // write code here
        var data = data
        var copy = data
        var count = 0
        
        // data数组是排序的数组
        inverse(data: &data, copy: &copy, start: 0, end: data.count - 1, count: &count)
        
        print(data)
        return count
    }
    
    private
    func inverse(data: inout [Int], copy: inout [Int], start: Int, end: Int, count: inout Int) {
        guard start < end else {
            return
        }
        
        let middle = (start + end) >> 1
        inverse(data: &copy, copy: &data, start: start, end: middle, count: &count)
        inverse(data: &copy, copy: &data, start: middle + 1, end: end, count: &count)
        
        //合并
        var firstStart = start
        var secondStart = middle + 1
        var index = start
        
        while firstStart <= middle, secondStart <= end {
            let firstValue = copy[firstStart]
            let secondValue = copy[secondStart]
            if firstValue <= secondValue {
                data[index] = firstValue
                firstStart += 1
            } else {
                // 后部分的当前数比前部分当前数小，那么逆序对个数就是 middle - firstStart + 1
                data[index] = secondValue
                secondStart += 1
                count += (middle - firstStart + 1)
                // 题目要求：
                // 输入一个数组,求出这个数组中的逆序对的总数P。并将P对1000000007取模的结果输出。 即输出P mod 1000000007
                count %= mod
            }
            index += 1
        }
        
        while firstStart <= middle {
            data[index] = copy[firstStart]
            firstStart += 1
            index += 1
        }
        
        while secondStart <= end {
            data[index] = copy[secondStart]
            secondStart += 1
            index += 1
        }
    }
}

Solution().InversePairs([2, 8, 8, 0])
*/

/*
//最大正方形
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * 最大正方形
     * @param matrix char字符型二维数组
     * @return int整型
     */
    
    //函数为以改点为右下角且底边和右边全为1的边长，用4个元素的小正方形进行推算
    // round2 优化
    func solve ( _ matrix: [[Character]]) -> Int {
        // write code here
        guard !matrix.isEmpty, !matrix[0].isEmpty else {
            return 0
        }
        
        var dp = [Int](repeating: 0, count: matrix[0].count)
        var topLeftValue = 0
        var maxValue = 0
        for row in 0 ..< matrix.count {
            for colum in 0 ..< matrix[0].count {
                if matrix[row][colum] == "0" {
                    dp[colum] = 0
                } else {
                    // 边界只能为1
                    let temp = dp[colum]
                    if row == 0 || colum == 0 {
                        dp[colum] = 1
                    } else {
                        // 根据左边、左上、上 三个相邻的元素最小加 1
                        // 作为下一次循环的左上角
                        dp[colum] = min(dp[colum], dp[colum - 1], topLeftValue) + 1
                    }
                    topLeftValue = temp
                    maxValue = max(maxValue, dp[colum])
                }
            }
        }
        
        return maxValue * maxValue
    }
    
    func solve1 ( _ matrix: [[Character]]) -> Int {
        // write code here
        guard !matrix.isEmpty, !matrix[0].isEmpty else {
            return 0
        }
        
        var dp = [[Int]](repeating: [Int](repeating: 0, count: matrix[0].count), count: matrix.count)
        var maxValue = 0
        for row in 0 ..< matrix.count {
            for colum in 0 ..< matrix[0].count {
                if matrix[row][colum] == "0" {
                    dp[row][colum] = 0
                } else {
                    // 边界只能为1
                    if row == 0 || colum == 0 {
                        dp[row][colum] = 1
                    } else {
                        // 根据左边、左上、上 三个相邻的元素最小加 1
                        dp[row][colum] = min(dp[row - 1][colum], dp[row][colum - 1], dp[row - 1][colum - 1]) + 1
                    }
                    maxValue = max(maxValue, dp[row][colum])
                }
            }
        }
        
        return maxValue * maxValue
    }
}
*/
/*
//旋转数组
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * 旋转数组
     * @param n int整型 数组长度
     * @param m int整型 右移距离
     * @param a int整型一维数组 给定数组
     * @return int整型一维数组
     */
    
    //环形替换
    //遍历次数为 n 和 m 的最大公约数
    func solve( _ n: Int,  _ m: Int,  _ a: [Int]) -> [Int] {
        guard m > 0, a.count > 0 else {
            return a
        }
        
        var a = a
        // 当m>n,取模
        let m = m % n
        let count = greatestCommonDivisor(n: n, k: m)
        for i in 0 ..< count {
            var pre = a[i]
            var current = i
            repeat {
                let next = (current + m) % n
                let temp = a[next]
                a[next] = pre
                pre = temp
                current = next
            } while i != current
        }
        
        return a
    }
    
    private
    func greatestCommonDivisor(n: Int, k: Int) -> Int {
        guard n > 1, k > 1 else {
            return 1
        }
        
        let minValue = n > k ? k : n
        let maxValue = n > k ? n : k
        
        guard maxValue % minValue != 0 else {
            return minValue
        }
        
        var result = 1
        let final = minValue / 2
        
        for i in 1 ... final {
            if minValue % i == 0 && maxValue % i == 0 {
                result = i
            }
        }
        
        return result
    }
    
    // 二次翻转数组
    func solve1 ( _ n: Int,  _ m: Int,  _ a: [Int]) -> [Int] {
        // write code here
        guard m > 0, a.count > 0 else {
            return a
        }
        
        var a = a
        // 当m>n,取模
        let m = m % n
        reverse(a: &a, start: 0, end: a.count - 1)
        reverse(a: &a, start: 0, end: m - 1)
        reverse(a: &a, start: m, end: a.count - 1)
        
        return a
    }
    
    private
    func reverse(a: inout [Int], start: Int, end: Int) {
        var start = start
        var end = end
        while start < end {
            a.swapAt(start, end)
            start += 1
            end -= 1
        }
    }
}

Solution().solve( 6,2,[1,2,3,4,5,6])
//Solution().greatestCommonDivisor(n: 9, k: 6)
*/

/*
// 正则匹配
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param s string字符串
     * @param p string字符串
     * @return bool布尔型
     */
    func match ( _ s: String,  _ p: String) -> Bool {
        // write code here
       
        let sArray = Array(s)
        let pArray = Array(p)
        
        var dp = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: p.count + 1), count: s.count + 1)
        // s和p都是""
        dp[0][0] = true
        
        for i in 0 ... s.count {
            for j in 1 ... p.count {
                if pArray[j - 1] == "*" {
                    dp[i][j] = dp[i][j - 2]
                    // 如果p和s末尾相同，那么结果可能和i-1有关
                    if isMatch(s: sArray, sIndex: i - 1, p: pArray, pIndex: j - 2) {
                        dp[i][j] = dp[i][j] || dp[i - 1][j]
                    }
                } else {
                    if isMatch(s: sArray, sIndex: i - 1, p: pArray, pIndex: j - 1) {
                        dp[i][j] = dp[i - 1][j - 1]
                    }
                }
            }
        }
        
        print(dp)
        return dp[s.count][p.count]
    }
    
    private
    func isMatch(s: [Character], sIndex: Int, p: [Character], pIndex: Int) -> Bool {
        guard sIndex >= 0 else {
            return false
        }
        
        return p[pIndex] == "." || p[pIndex] == s[sIndex]
    }
    
    // 这是指数级别的复杂度
    private
    func matchString(_ s: [Character], sStart: Int, pArray: [Character], pStart: Int) -> Bool {
        
        // 全部s和p都遍历完了，那么就返回true
        if sStart == s.count, pStart == pArray.count {
            return true
        }
        
        // 如果p结束了，s还没有结束，那么返回false, s结束了，p没有结束，匹配是可能成功的
        if pStart == pArray.count {
            return false
        }
        
        print("s start:\(sStart) p start: \(pStart) p: \(pArray.count)")
        
        let pValue = pArray[pStart]
        let afterValue: Character? = pStart + 1 < pArray.count ? pArray[pStart + 1] : nil
        if afterValue == "*" {
            // 如果后面为*那么有三种情况
            // 1. 当前元素相等
            //  a. *代表0，那么 pstart移动
            //  b. *代表1，那么 sstart 和 pstart 移动
            //  c. *代表多次，那么 sstart 移动
            // 2. 当前元素不相等
            //  a. * 只能表示0
            // 结果取并集
            if sStart == s.count {
                //s已经到尽头了,那么p就只有代表0了
                return matchString(s, sStart: sStart, pArray: pArray, pStart: pStart + 2)
            } else {
                if s[sStart] == pValue || pValue == "." {
                    return matchString(s, sStart: sStart, pArray: pArray, pStart: pStart + 2) || matchString(s, sStart: sStart + 1, pArray: pArray, pStart: pStart + 2) || matchString(s, sStart: sStart + 1, pArray: pArray, pStart: pStart)
                } else {
                    return matchString(s, sStart: sStart, pArray: pArray, pStart: pStart + 2)
                }
            }
            
        } else {
            // 如果s已经到头，当前p的元素后面不是*，那么就一定匹配失败
            if sStart < s.count {
                //不是*号，那么前面的需要一样
                if pValue == "." || s[sStart] == pValue {
                    return matchString(s, sStart: sStart + 1, pArray: pArray, pStart: pStart + 1)
                }
            }
            
        }
        
        return false
    }
}

Solution().match("aaaaaaaaaaaaab","a*a*a*a*a*a*a*a*a*a*c")
*/
//


struct Heap<T> {
    let comparetor: (T, T) -> Bool
    init(comparetor: @escaping (T, T) -> Bool) {
        self.comparetor = comparetor
    }
    
    var data: [T] = []
    var size: Int {
        return data.count
    }
    
    var isEmpty: Bool {
        return data.isEmpty
    }
    
    var top: T? {
        return data.first
    }
    
    mutating
    func removeTop() -> T? {
        return data.isEmpty ? nil : data.removeFirst()
    }
    
    mutating
    func insert(item: T) {
        
    }
    
    private
    func heapify() {
        
    }
}

////数据流中的中位数
////空间复杂度 O(n) ，时间复杂度 O(nlogn)
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param num int整型
     * @return 无
     */
    func Insert ( _ num: Int) {
        // write code here

    }

    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param 无
     * @return double浮点型
     */
    func GetMedian () -> Double {
        // write code here

    }
}


////N皇后问题
//public class Solution {
//    /**
//     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
//     *
//     * @param n int整型 the n
//     * @return int整型
//     */
//    func Nqueen ( _ n: Int) -> Int {
//        // write code here
//
//    }
//}

/*
//把二叉树打印成多行
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param pRoot TreeNode类
     * @return int整型二维数组
     */
    func Print ( _ pRoot: TreeNode?) -> [[Int]] {
        // write code here
        
        guard let pRoot = pRoot else {
            return []
        }
        
        var queue = Queue<TreeNode>()
        var tempCount = 0
        var count = 1
        var array: [Int] = []
        var result: [[Int]] = []
        
        queue.enqueue(value: pRoot)
        while !queue.isEmpty {
            let node = queue.dequeue()!
            array.append(node.val)
            
            count -= 1
            
            if let left = node.left {
                queue.enqueue(value: left)
                tempCount += 1
            }
            
            if let right = node.right {
                queue.enqueue(value: right)
                tempCount += 1
            }
            
            if count == 0 {
                result.append(array)
                array.removeAll()
                
                count = tempCount
                tempCount = 0
            }
        }
        
        return result
    }
}
*/

