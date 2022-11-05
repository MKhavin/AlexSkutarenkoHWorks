var myPhysicalResults = (pushUps: 12, pullUps: 0, squats: 20)

print("Мои физ. результаты: \(myPhysicalResults)\n")

print("Мои физ. результаты с пояснениями:")
print("1) Отжимания - \(myPhysicalResults.pushUps)")
print("2) Подтягивания - \(myPhysicalResults.1)")
print("3) Приседания - \(myPhysicalResults.squats)")

var milanasPhysicalResults = (pushUps: 5, pullUps: 0, squats: 15)
let tempTuple = myPhysicalResults

print("\nФиз. результаты Миланы:")
print("1) Отжимания - \(milanasPhysicalResults.0)")
print("2) Подтягивания - \(milanasPhysicalResults.1)")
print("3) Приседания - \(milanasPhysicalResults.squats)")

myPhysicalResults = milanasPhysicalResults
milanasPhysicalResults = tempTuple

print("\n----------------------------------------------------------\n")
print("Результат после обмена значениями:")
print("Мои результаты: \(myPhysicalResults)")
print("Результы Миланы: \(milanasPhysicalResults)")
print("\n----------------------------------------------------------\n")

let differencesInResults = (pushUps: myPhysicalResults.0 - milanasPhysicalResults.pushUps,
                            pullUps: myPhysicalResults.pullUps - milanasPhysicalResults.1,
                            squats: myPhysicalResults.squats - milanasPhysicalResults.squats)

print("Разница в результатах:")
print(differencesInResults)

