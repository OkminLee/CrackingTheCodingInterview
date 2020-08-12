import Foundation

class Node<T:Hashable> {
    var value: T
    var next: Node?
    
    init(_ value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}

struct LinkedList<T:Hashable> {
    var head: Node<T>?
    var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func push(_ value: T) {
        self.head = Node(value, next: head)
        
        if tail == nil {
            tail = head
        }
    }
    
    mutating func pop() -> T? {
        guard head != nil else { return nil }
        head = head?.next
        if isEmpty {
            tail = nil
        }
        return head?.value
    }
    
    mutating func removeDuplicate() {
        var set = Set<T>()
        var node = head
        var pre: Node<T>? = nil
        while node != nil {
            if set.contains(node!.value) {
                pre?.next = node?.next
            } else {
                set.insert(node!.value)
                pre = node
            }
            node = node!.next
        }
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}

func removeDuplicate(list: LinkedList<Int>) {
    var list = list
    var buffer = -1
    while list.head != nil {
        if let value = list.pop() {
            if buffer == value {
                print(buffer, value)
            } else {
                buffer = value
            }
        }
    }
}


var list = LinkedList<Int>()
list.push(1)
list.push(2)
list.push(3)
list.push(1)
list.push(4)
list.push(4)

list.removeDuplicate()
print(list.description)
