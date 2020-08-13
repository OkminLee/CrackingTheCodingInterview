import Foundation

extension Array {
    func push<T>(value: T) {
        for element in self {
            print(value, element)
        }
    }
}

struct Stack<T> {
    var array: [T?]
    var head: Int
    
    mutating func push(value: T) {
        if head == array.count {
            print("stack is full")
        } else {
            array[head] = value
            head += 1
        }
    }
    
    mutating func pop() -> T? {
        head -= 1
        let result = array[head]
        array[head] = nil
        return result
    }
}

let n = 10
var array = Array<Int?>(repeating: nil, count: n)

var stack1 = Stack(array: Array<Int?>(array[0..<n/3]), head: 0)
var stack2 = Stack(array: Array<Int?>(array[n/3..<n/3*2]), head: 0)
var stack3 = Stack(array: Array<Int?>(array[n/3*2..<n]), head: 0)

stack1.push(value: 0)
stack1.push(value: 1)
stack1.push(value: 2)
stack1.push(value: 3)
print(stack1, stack2, stack3)

stack1.pop()
print(stack1, stack2, stack3)

stack1.pop()
stack1.push(value: 3)
print(stack1, stack2, stack3)
