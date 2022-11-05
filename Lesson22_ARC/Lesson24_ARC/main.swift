// MARK: Lesson examples

//var playground = true
//
//class Student {
////    weak var teacher: Teacher?
//    unowned let teacher: Teacher
//
//    deinit {
//        print("goodbye student")
//    }
//
//    init(teacher: Teacher) {
//        self.teacher = teacher
//    }
//}
//
//class Teacher {
//    var studnet: Student!
//    var closure: (() -> Void)?
//    lazy var test2: ((Bool) -> Void) = { [unowned self] (_ a: Bool) -> Void in
//        print(self)
//    }
//
//    init( ) {
//        studnet = Student(teacher: self)
//    }
//
//    deinit {
//        print("goodbye teacher")
//    }
//}
//
//var closure3: (() -> Void)?
//
//if playground {
//    let teacher = Teacher()
////    var closure3: (() -> Void)?
//    teacher.test2(true)
//
//    teacher.closure = { [unowned teacher] in
//        print(teacher)
//    }
//
//    if playground {
//        let student = Student(teacher: teacher)
//        teacher.studnet = student
////        student.teacher = teacher
//    }
//
//    closure3 = { [unowned teacher] in
//        print(teacher)
//    }
//
//    closure3!()
//
//    print("exit playground")
//}
//
//
//var x = 10
//var y = 20
//
//class Human {
//    var name: String = "a"
//}
//
//var h = Human()
//
//var closure: () -> Void = { [x] in
//    print(x)
//    print(y)
//}
//
//var closure2: (Int) -> Int = { [y, h] (_ a: Int) -> Int in
//    print("\(x) \(y) \(h.name)")
//    return a
//}
//
////closure()
//closure2(1)
//
//x = 30
//y = 40
//h.name = "bb"
//
////closure()
//closure2(1)
//
//print("end")


// MARK: Homework
//1. Семя - мама, папа, дети. Папа глава семьи, мама - контролирует детей. У детей есть ссылки друг на друга, могут вызывать методы и т.д.
//3. Дети могут обращаться к маме. Дети могут обращаться к папе.
//5. Мама может общаться с детьми и с папой.
//7. Папа может общаться с детьми и мамой.
//8. Вся иерархия находится в классе Семья и у этого класса есть метод распечатывания их всех.
//9. Также у папы есть 3 замыкания - обращается к семье для распечатки семьи, 2 - распечатать маму, 3 - распечатать всех детей
//
//Итог:
//Необходимо создать все зависимости в соответствии с иерархией и при выходе из зоны видимости все объекты должны быть уничтожены.

class WeakContainer<T: AnyObject> {
    weak var value : T?

    init (value: T) {
        self.value = value
    }

    func get() -> T? {
        return value
    }
}

class MyHuman {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

class Dad: MyHuman {
    unowned var wife: Mom?
    var children: [WeakContainer<Child>?] = []
    lazy var myFamily: () -> Void = { [weak self] in
        print("Me: \(self?.name)")
        print("My wife: \(self?.wife)")
        self?.children.forEach { child in
            print("Child: \(child?.value?.name)")
        }
    }
    lazy var myWife: () -> Void = { [weak self] in
        print("My wife: \(self?.wife?.name)")
    }
    lazy var myChildren: () -> Void = { [weak self] in
        self?.children.forEach({ child in
            print(child?.value?.name)
        })
    }
    
    init(name: String, wife: Mom? = nil) {
        self.wife = wife
        super.init(name: name)
    }
    
    deinit {
        print("Dad deinit")
    }
}

class Mom: MyHuman {
    unowned var husband: Dad?
    var children: [WeakContainer<Child>?] = []
    
    init(name: String, husband: Dad? = nil) {
        self.husband = husband
        super.init(name: name)
    }
    
    deinit {
        print("Mom deinit")
    }
}

class Child: MyHuman {
    weak var dad: Dad?
    weak var mom: Mom?
    
    convenience init(name: String, dad: Dad?, mom: Mom?) {
        self.init(name: name)
        self.dad = dad
        self.mom = mom
    }
    
    deinit {
        print("Child deinit")
    }
}

class Family {
    var dad: Dad?
    var mom: Mom?
    var children: [Child] = []
    
    init() {
        mom = Mom(name: "Nino")
        dad = Dad(name: "Avto", wife: mom)
        mom?.husband = dad
        
        let firstChild = Child(name: "Michael", dad: dad, mom: mom)
        let secondChild = Child(name: "Milana", dad: dad, mom: mom)
        children.append(firstChild)
        children.append(secondChild)

        dad?.children.append(WeakContainer(value: firstChild))
        dad?.children.append(WeakContainer(value: secondChild))
        mom?.children.append(WeakContainer(value: firstChild))
        mom?.children.append(WeakContainer(value: secondChild))
    }
    
    func showFamilyMembers() {
        print("Dad: \(dad?.name)")
        print("Mom: \(mom?.name)")
        children.forEach { child in
            print("Children: \(child.name)")
        }
    }
}

let myFamily = Family()
myFamily.showFamilyMembers()
myFamily.dad?.myFamily()
myFamily.dad?.myWife()
myFamily.dad?.myChildren()
myFamily.mom = nil
myFamily.children = []
myFamily.dad = nil

