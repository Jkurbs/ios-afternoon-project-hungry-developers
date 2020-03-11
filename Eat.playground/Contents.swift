import UIKit

class Spoon {
    
    private var lock = NSLock()
    
    func pickUp() {
        sleep(2)
        print("Pick up")
        putDown()
    }
    
    func putDown() {
        print("Put down")
    }
}

struct Developer {
    
    var leftSpoon: Spoon!
    var rightSpoon: Spoon!
    
    func think() {
        leftSpoon.pickUp()
        rightSpoon.pickUp()
        print("Think")
        return
    }
    
    func eat() {
        sleep(5)
        leftSpoon.putDown()
        rightSpoon.putDown()
        print("Eat")
    }
    
    func run() {
        think()
        eat()
    }
}

let spoon1 = Spoon()
let spoon2 = Spoon()
let spoon3 = Spoon()
let spoon4 = Spoon()
let spoon5 = Spoon()

let developers = [Developer(leftSpoon: spoon1, rightSpoon: spoon2), Developer(leftSpoon: spoon2, rightSpoon: spoon3)]

DispatchQueue.concurrentPerform(iterations: 2) {
    developers[$0].run()
}
