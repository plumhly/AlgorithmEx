import Foundation
// 2021_10_25
struct Topic3 {
    static func test() {
        Ex1.test()
        Ex2.test()
    }
}

extension Topic3 {
    public struct Ex1 {
        static func findDuplicateElement(in array: inout [Int]) -> Int? {
            guard !array.isEmpty else {
                return nil
            }
            
            var isFindElement = false
            var currentIndex = 0
            var element: Int? = nil
            
            while !isFindElement && currentIndex < array.count {
                let value = array[currentIndex]
                if currentIndex == value {
                    currentIndex += 1
                } else {
                    if value < currentIndex {
                        isFindElement = true
                        element = value
                    }
                    array.swapAt(value, currentIndex)
                }
            }
            
            return element
        }
        
        public static func test() {
            var array1: [Int] = []
            assert(findDuplicateElement(in: &array1) == nil)
            
            var array2 = [2, 3, 1, 0, 2, 5, 3]
            assert(findDuplicateElement(in: &array2) == 2)
            print("\(self) OVER")
        }
    }
}

extension Topic3 {
    struct Ex2 {
        static func findDuplicateElement(in array: [Int]) -> Int? {
            guard !array.isEmpty else {
                return nil
            }
            
            var start = 1
            var end = array.count - 1
            var element: Int? = nil
            
            while end >= start {
                let middle = (start + end) >> 1
                let count = count(in: array, start: start, end: middle)
                if start == end {
                    if count > 1 {
                        element = start
                    }
                    break
                }
                
                let leftCount = middle - start + 1
                
                if count > leftCount {
                    end = middle
                } else {
                    start = middle + 1
                }
            }
            
            return element
        }
        
        private static func count(in array: [Int], start: Int, end: Int) -> Int {
            return array.reduce(0) { count, value in
                return value >= start && value <= end ? count + 1 : count
            }
        }
        
        static func test() {
            let array1 = [2, 2, 5, 4, 3, 6, 1]
            assert(findDuplicateElement(in: array1) == 2)
            print("\(self) OVER")
        }
    }
}
