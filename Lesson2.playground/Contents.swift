//Задание 1
print("Диапазон Int8: \(Int8.min) - \(Int8.max)")
print("Диапазон UInt8: \(UInt8.min) - \(UInt8.max)")
print("Диапазон Int16: \(Int16.min) - \(Int16.max)")
print("Диапазон UInt16: \(UInt16.min) - \(UInt16.max)")
print("Диапазон Int32: \(Int32.min) - \(Int32.max)")
print("Диапазон UInt32: \(UInt32.min) - \(UInt32.max)")
print("Диапазон Int64: \(Int64.min) - \(Int64.max)")
print("Диапазон UInt64: \(UInt64.min) - \(UInt64.max) \n")


//Задание 2
let numberOne = 12
let numberTwo: Float = 2.45
let numberThree = 4.02

let intResult = numberOne + Int(numberTwo) + Int(numberThree)
let floatResult = Float(numberOne) + numberTwo + Float(numberThree)
let doubleResult = Double(numberOne) + Double(numberTwo) + numberThree

print("Значение констант:")
print("Int: (\(numberOne); Float: (\(numberTwo)); Double: (\(numberThree))")
print("Сумма констант Int: (\(intResult))")
print("Сумма констант Float: (\(floatResult))")
print("Сумма констант Double: (\(doubleResult)) \n")

//Задание 3

if Double(intResult) > doubleResult {
    print("Результат Double > Int")
} else {
    print("Результат Int > Double")
}
