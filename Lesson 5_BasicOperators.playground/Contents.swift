//Exersice 1
print("Exersice 1\n")

let myBirthdayMonth = 5
let myBirthdayDay = 23
let currrentYear = 2020
var isLeapYear = false

if currrentYear % 400 == 0 || currrentYear % 4 == 0 {
    isLeapYear = true
}

var secBeforeBirthday = 0

////Отход от постановки задачи
//for month in 1..<myBirthdayMonth{
//    if month % 2 == 0 {
//        if month == 2 {
//            if isLeapYear {
//                secBeforeBirthday += 60 * 60 * 24 * 29
//            } else {
//                secBeforeBirthday += 60 * 60 * 24 * 28
//            }
//        } else if month == 8 {
//            secBeforeBirthday += 60 * 60 * 24 * 31
//        } else {
//            secBeforeBirthday += 60 * 60 * 24 * 30
//        }
//    } else {
//        secBeforeBirthday += 60 * 60 * 24 * 31
//    }
//}
if myBirthdayMonth == 2 {
    secBeforeBirthday = 60 * 60 * 24 * 31
} else if myBirthdayMonth == 3 {
    secBeforeBirthday = 60 * 60 * 24
    if isLeapYear {
        secBeforeBirthday *= 60
    } else {
        secBeforeBirthday *= 59
    }
} else if myBirthdayMonth == 4 {
    secBeforeBirthday = 60 * 60 * 24
    if isLeapYear {
        secBeforeBirthday *= 91
    } else {
        secBeforeBirthday *= 90
    }
} else if myBirthdayMonth == 5 {
    secBeforeBirthday = 60 * 60 * 24
    if isLeapYear {
        secBeforeBirthday *= 121
    } else {
        secBeforeBirthday *= 120
    }
} else if myBirthdayMonth == 6 {
    secBeforeBirthday = 60 * 60 * 24
    if isLeapYear {
        secBeforeBirthday *= 152
    } else {
        secBeforeBirthday *= 151
    }
}  else if myBirthdayMonth == 7 {
    secBeforeBirthday = 60 * 60 * 24
    if isLeapYear {
        secBeforeBirthday *= 182
    } else {
        secBeforeBirthday *= 181
    }
} else if myBirthdayMonth == 8 {
    secBeforeBirthday = 60 * 60 * 24
    if isLeapYear {
        secBeforeBirthday *= 213
    } else {
        secBeforeBirthday *= 212
    }
} else if myBirthdayMonth == 9 {
    secBeforeBirthday = 60 * 60 * 24
    if isLeapYear {
        secBeforeBirthday *= 244
    } else {
        secBeforeBirthday *= 243
    }
} else if myBirthdayMonth == 10 {
    secBeforeBirthday = 60 * 60 * 24
    if isLeapYear {
        secBeforeBirthday *= 274
    } else {
        secBeforeBirthday *= 273
    }
} else if myBirthdayMonth == 11 {
    secBeforeBirthday = 60 * 60 * 24
    if isLeapYear {
        secBeforeBirthday *= 305
    } else {
        secBeforeBirthday *= 304
    }
} else if myBirthdayMonth == 12 {
    secBeforeBirthday = 60 * 60 * 24
    if isLeapYear {
        secBeforeBirthday *= 335
    } else {
        secBeforeBirthday *= 334
    }
}

secBeforeBirthday += 60 * 60 * 24 * myBirthdayDay
print("Current year: \(currrentYear)")
print("Leap year: \(isLeapYear)")
print("My birthday: \(myBirthdayDay).\(myBirthdayMonth)")
print("Seconds before my birthday: \(secBeforeBirthday) sec.")
print("\n----------------------------\n")
//

//Exersice 2
print("Exersice 2\n")

if myBirthdayMonth >= 1 && myBirthdayMonth <= 3 {
    print("You were born in first quarter")
} else if myBirthdayMonth >= 4 && myBirthdayMonth <= 6 {
    print("You were born in second quarter")
} else if myBirthdayMonth >= 7 && myBirthdayMonth <= 9 {
    print("You were born in third quarter")
} else if myBirthdayMonth >= 10 && myBirthdayMonth <= 12 {
    print("You were born in fourth quarter")
}
print("\n----------------------------\n")

//Exercise 4
print("Chess desk:")
print("W", "B", "W", "B", "W", "B", "W", "B")
print("B", "W", "B", "W", "B", "W", "B", "W")
print("W", "B", "W", "B", "W", "B", "W", "B")
print("B", "W", "B", "W", "B", "W", "B", "W")
print("W", "B", "W", "B", "W", "B", "W", "B")
print("B", "W", "B", "W", "B", "W", "B", "W")
print("W", "B", "W", "B", "W", "B", "W", "B")
print("B", "W", "B", "W", "B", "W", "B", "W")

let coordinates = (x: 1, y: 7)
print("We're searching: \(coordinates)")

if (coordinates.x % 2 == 0 && coordinates.y % 2 == 0)
    || (coordinates.x % 2 != 0 && coordinates.y % 2 != 0) {
    print("Cell \(coordinates) is \"W\"")
} else {
    print("Cell \(coordinates) is \"B\"")
}

