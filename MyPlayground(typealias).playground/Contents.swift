import UIKit

var str = "Hello, playground"
//MARK:对已有的类型进行重命名
func distance(p1: CGPoint, p2: CGPoint) -> Double {
    let x = Double(p1.x - p2.x)
    let y = Double(p1.y - p2.y)
    return sqrt(x * x + y * y)
}

typealias Distance = Double

func distance2(p1: CGPoint, p2: CGPoint) -> Double {
    let x = Distance(p1.x - p2.x)
    let y = Distance(p1.y - p2.y)
    return sqrt(x * x + y * y)
}


//MARK:对闭包进行重新命名
typealias Success = (_ result: String) -> Void
typealias Failure = (_ error: String) -> Void

func excuteNetworking(_ successBlock: Success, failBlock: Failure) {
    
}
//MARK: 对关联类型重定义，协助协议实现泛型功能


/// 食物协议
protocol Food {
    func desc() -> String
}


/// 苹果类
class Apple: Food {
    func desc() -> String {
        return "apple"
    }
}

/// 桔子类
class Orange: Food {
    func desc() -> String {
        return "orange"
    }
}


/// 动物协议
protocol Animal {
    func eat(food: Food)
}

/// 人类 1
class People: Animal {
    func eat(food: Food) {
        print("eat \(food.desc())")
    }
}

/// 狗类 1
class Dog: Animal {
    func eat(food: Food) {
        print("eat \(food.desc())")
    }
}

/// 狐类 1
class Fox: Animal {
    func eat(food: Food) {
        print("eat \(food.desc())")
    }
}

let p = People()
p.eat(food: Apple())
p.eat(food: Orange())



/// 动物协议1
protocol Animal2 {
    associatedtype F: Food
    func eat(food: F)
}

/// 某类人 2
class People2<F:Apple>: Animal2 {
    typealias MF = F // 对于已有协议重命名
    
    func eat(food: MF) {
        print("eat \(food.desc())")
    }
}
/// 某类人 3
class People3<F:Orange>: Animal2 {
    typealias MF = F
    
    func eat(food: MF) {
        print("eat \(food.desc())")
    }
}
/// 狗类  2
class Dogs<F:Food>: Animal2 {
    typealias MF = F // 对于已有协议重命名
    
    func eat(food: MF) {
        print("eat \(food.desc())")
    }
}
/// 人类  2
class Peoples<F:Food>: Animal2 {
    typealias MF = F
    
    func eat(food: MF) {
        print("eat \(food.desc())")
    }
}

/// 爱吃苹果的人
let p3:People2<Apple> = People2()
p3.eat(food: Apple()) // yes
//p3.eat(food: Orange()) // no

/// 爱吃桔子的人
let p4:People3<Orange> = People3()
p4.eat(food: Orange()) // yes
//p4.eat(food: Apple())  // no

//MARK:某类人
/// 爱桔子
let p51:Peoples<Orange> = Peoples()
p51.eat(food: Orange())
//p5.eat(food: Apple())
/// 爱苹果
let p52:Peoples<Apple> = Peoples()
p52.eat(food: Apple())
//p6.eat(food: Orange())


public protocol Automobile {
    associatedtype FuelType
    associatedtype ExhaustType
    
    func drive(fuel: FuelType) -> ExhaustType}

public protocol Fuel {
    associatedtype ExhaustType
    func consume() -> ExhaustType
}

public protocol Exhaust {
    init()
    
    func emit()
}



//public struct UnleadedGasoline: Fuel {
//    public func consume() -> E {
//        print("...consuming unleaded gas...")
//        return E()
//    }
//}
//public struct CleanExhaust: Exhaust {
//    public init() {}
//    public func emit() {  print("...this is some clean exhaust...")
//    }
//}
//public class Car: Automobile {
//    public func drive(fuel: F) -> E {      return fuel.consume()
//    }
//}
//https://andrew-anlu.github.io/blog/2017/01/06/swift3-associatedtypeyong-fa/
//https://blog.csdn.net/longshihua/article/details/7434788
//https://www.jianshu.com/p/e0f5c3486bc8
//https://www.jianshu.com/p/ac5185c89af1
