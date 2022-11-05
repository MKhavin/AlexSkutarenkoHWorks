//Exercise 1
print("Exercise 1\n")

let firstNumber = "123"
let secondNUmber = "3213adffg"
let thirdNumber = "1234123"
let fourthNumber = "abcd123"
let fifthNumber = "32134"

var sum = Int(firstNumber)! + Int(thirdNumber)! + Int(fifthNumber)!

if let value = Int(secondNUmber) {
    sum += value
}

if let value = Int(fourthNumber) {
    sum += value
}

print("Sum of numbers: \(sum)")
print("\n---------------------------------\n")

//Exercise 2
print("Exercise 2\n")

let firstResponse = (statusCode: 250,
                     message: Optional("All ok."),
                     errorMessage: Optional("Oh no !!! Mama mia !!!!"))

switch firstResponse.statusCode {

case 200..<300:
    if let message = firstResponse.message {
        print(message)
    } else {
        print("Message not found.....")
    }
default:
    if let error = firstResponse.errorMessage {
        print(error)
    } else {
        print("Error message not found......")
    }
}

let secondResponse: (message: String?, errorMesage: String?) = ("Good good", nil)

if let currentMessage = secondResponse.message {
    print(currentMessage)
} else if let currentMessage = secondResponse.errorMesage {
    print(currentMessage)
}

print("\n---------------------------------\n")

//Exercise 3
print("Exercise 3\n")

/*
//Отступление от урока :))))
class Student {
    var name: String!
    var autoNumber: String?
    var examMark: Int?
    
    init(name: String, autoNumber: String? = nil, examMark: Int? = nil) {
        self.name = name
        self.autoNumber = autoNumber
        self.examMark = examMark
    }
}

 var students: [Student] = []
 students.append(Student(name: "Michael", examMark: 5))
 students.append(Student(name: "Milana", examMark: 5))
 students.append(Student(name: "Ronen", autoNumber: "XZ123RU"))
 students.append(Student(name: "Nino", autoNumber: "AZ321GE"))
 students.append(Student(name: "Avto", examMark: 4))

 for student in students {
     print("Student \(student.name):")
     
     if let autoNummber = student.autoNumber {
         print("1) Student has auto. Auto's number - \(autoNummber)")
     } else {
         print("1) Doesn't has auto;")
     }
     
     if let examMark = student.examMark {
         print("2) Student was on Exam. Exam mark is \(examMark)")
     } else {
         print("2) Student wasn't on exam")
     }
     
     print("\n----------------------------\n")
 }
*/

var firstStudent: (name: String?, autoNumber: String?, examMark: Int?)
var secondStudent: (name: String?, autoNumber: String?, examMark: Int?)
var thirdStudent: (name: String?, autoNumber: String?, examMark: Int?)
var fourthStudent: (name: String?, autoNumber: String?, examMark: Int?)
var fifthStudent: (name: String?, autoNumber: String?, examMark: Int?)

firstStudent.name = "Avto"
secondStudent.name = "Rone"
thirdStudent.name = "Milana"
fourthStudent.name = "Michael"
fifthStudent.name = "Nino"

secondStudent.autoNumber = "XE123RUS"
fifthStudent.autoNumber = "ZE321GE"

fourthStudent.examMark = 5
thirdStudent.examMark = 5

print("Student \(firstStudent.name!):")

if let autoNummber = firstStudent.autoNumber {
    print("1) Student has auto. Auto's number - \(autoNummber)")
} else {
    print("1) Doesn't has auto;")
}

if let examMark = firstStudent.examMark {
    print("2) Student was on Exam. Exam mark is \(examMark)")
} else {
    print("2) Student wasn't on exam")
}

print("\n----------------------------\n")

print("Student \(secondStudent.name!):")

if let autoNummber = secondStudent.autoNumber {
    print("1) Student has auto. Auto's number - \(autoNummber)")
} else {
    print("1) Doesn't has auto;")
}

if let examMark = secondStudent.examMark {
    print("2) Student was on Exam. Exam mark is \(examMark)")
} else {
    print("2) Student wasn't on exam")
}

print("\n----------------------------\n")

print("Student \(thirdStudent.name!):")

if let autoNummber = thirdStudent.autoNumber {
    print("1) Student has auto. Auto's number - \(autoNummber)")
} else {
    print("1) Doesn't has auto;")
}

if let examMark = thirdStudent.examMark {
    print("2) Student was on Exam. Exam mark is \(examMark)")
} else {
    print("2) Student wasn't on exam")
}

print("\n----------------------------\n")

print("Student \(fourthStudent.name!):")

if let autoNummber = fourthStudent.autoNumber {
    print("1) Student has auto. Auto's number - \(autoNummber)")
} else {
    print("1) Doesn't has auto;")
}

if let examMark = fourthStudent.examMark {
    print("2) Student was on Exam. Exam mark is \(examMark)")
} else {
    print("2) Student wasn't on exam")
}

print("\n----------------------------\n")

print("Student \(fifthStudent.name!):")

if let autoNummber = fifthStudent.autoNumber {
    print("1) Student has auto. Auto's number - \(autoNummber)")
} else {
    print("1) Doesn't has auto;")
}

if let examMark = fifthStudent.examMark {
    print("2) Student was on Exam. Exam mark is \(examMark)")
} else {
    print("2) Student wasn't on exam")
}

print("\n----------------------------\n")
