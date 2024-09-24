//1
for number in 1...100 {
    if number % 3 == 0 && number % 5 == 0 {
        print("FizzBuzz")
    } else if number % 3 == 0 {
        print("Fizz")
    } else if number % 5 == 0 {
        print("Buzz")
    } else {
        print(number)
    }
}

//2
func isPrime(_ number: Int) -> Bool {
    if number <= 1 {
        return false
    }
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }
    return true
}
print("Prime numbers between 1 and 100 are:")
for number in 1...100 {
    if isPrime(number) {
        print(number)
    }
}

//3
import Foundation
func convertFromCelsius(_ celsius: Double) -> (fahrenheit: Double, kelvin: Double) {
    let fahrenheit = (celsius * 9 / 5) + 32
    let kelvin = celsius + 273.15
    return (fahrenheit, kelvin)
}
func convertFromFahrenheit(_ fahrenheit: Double) -> (celsius: Double, kelvin: Double) {
    let celsius = (fahrenheit - 32) * 5 / 9
    let kelvin = celsius + 273.15
    return (celsius, kelvin)
}
func convertFromKelvin(_ kelvin: Double) -> (celsius: Double, fahrenheit: Double) {
    let celsius = kelvin - 273.15
    let fahrenheit = (celsius * 9 / 5) + 32
    return (celsius, fahrenheit)
}
print("Enter the temperature:")
if let input = readLine(), let temperature = Double(input) {
    print("Enter the unit of measurement (C for Celsius, F for Fahrenheit, K for Kelvin):")
    if let unit = readLine() {
        switch unit.uppercased() {
        case "C":
            let (fahrenheit, kelvin) = convertFromCelsius(temperature)
            print("\(temperature)°C = \(fahrenheit)°F")
            print("\(temperature)°C = \(kelvin)K")
        case "F":
            let (celsius, kelvin) = convertFromFahrenheit(temperature)
            print("\(temperature)°F = \(celsius)°C")
            print("\(temperature)°F = \(kelvin)K")
        case "K":
            let (celsius, fahrenheit) = convertFromKelvin(temperature)
            print("\(temperature)K = \(celsius)°C")
            print("\(temperature)K = \(fahrenheit)°F")
            
        default:
            print("Invalid unit of measurement. Please enter C, F, or K.")
        }
    }
} else {
    print("Invalid temperature value.")
}

//4
import Foundation
func displayMenu() {
    print("\n=== Shopping List Manager ===")
    print("1. Add item to shopping list")
    print("2. Remove item from shopping list")
    print("3. Display shopping list")
    print("4. Exit")
    print("============================")
}
var shoppingList: [String] = []
var isRunning = true
while isRunning {
    displayMenu()
    print("Choose an option (1-4):", terminator: " ")
    if let choice = readLine() {
        switch choice {
        case "1":
            print("Enter the item to add:")
            if let item = readLine(), !item.isEmpty {
                shoppingList.append(item)
                print("\(item) has been added to the shopping list.")
            } else {
                print("Invalid input. Please enter a valid item.")
            }
        case "2":
            print("Enter the item to remove:")
            if let item = readLine() {
                if let index = shoppingList.firstIndex(of: item) {
                    shoppingList.remove(at: index)
                    print("\(item) has been removed from the shopping list.")
                } else {
                    print("Item not found in the shopping list.")
                }
            } else {
                print("Invalid input. Please enter a valid item.")
            }
        case "3":
            if shoppingList.isEmpty {
                print("The shopping list is empty.")
            } else {
                print("Current shopping list:")
                for (index, item) in shoppingList.enumerated() {
                    print("\(index + 1). \(item)")
                }
            }
        case "4":
            isRunning = false
            print("Exiting the application. Goodbye!")
            
        default:
            print("Invalid choice. Please select a valid option.")
        }
    }
}


//5
import Foundation
func countWordFrequencies(from sentence: String) -> [String: Int] {
    let cleanedSentence = sentence
        .lowercased()
        .replacingOccurrences(of: "[^a-zA-Z0-9 ]", with: "", options: .regularExpression)
    let words = cleanedSentence.split(separator: " ").map { String($0) }
    var frequencyDict: [String: Int] = [:]
    for word in words {
        frequencyDict[word, default: 0] += 1
    }
    return frequencyDict
}
print("Enter a sentence:")
if let input = readLine() {
    let wordFrequencies = countWordFrequencies(from: input)
    print("\nWord Frequencies:")
    for (word, frequency) in wordFrequencies {
        print("\(word): \(frequency)")
    }
} else {
    print("Invalid input.")
}

//6
import Foundation
func fibonacci(_ n: Int) -> [Int] {
    guard n > 0 else {
        return []
    }
    var fibSequence: [Int] = []
    for i in 0..<n {
        if i == 0 {
            fibSequence.append(0)
        } else if i == 1 {
            fibSequence.append(1)
        } else {
            let nextNumber = fibSequence[i - 1] + fibSequence[i - 2] // Sum of the two previous numbers
            fibSequence.append(nextNumber)
        }
    }
    return fibSequence
}
print("Enter a number:")
if let input = readLine(), let n = Int(input) {
    let fibonacciNumbers = fibonacci(n)
    print("Fibonacci sequence up to \(n): \(fibonacciNumbers)")
} else {
    print("Invalid input. Please enter a valid integer.")
}

//7
import Foundation
func processStudentScores() {
    var studentNames: [String] = []
    var studentScores: [Double] = []
    while true {
        print("Enter student name (or type 'done' to finish):", terminator: " ")
        guard let name = readLine(), name.lowercased() != "done" else {
            break
        }
        print("Enter score for \(name):", terminator: " ")
        if let scoreInput = readLine(), let score = Double(scoreInput) {
            studentNames.append(name)
            studentScores.append(score)
        } else {
            print("Invalid score. Please enter a valid number.")
        }
    }
    let totalScore = studentScores.reduce(0, +)
    let averageScore = totalScore / Double(studentScores.count)
    let highestScore = studentScores.max() ?? 0
    let lowestScore = studentScores.min() ?? 0
    print("\nStudent Scores:")
    for (index, name) in studentNames.enumerated() {
        let score = studentScores[index]
        let status = score >= averageScore ? "above" : "below"
        print("\(name): \(score) - \(status) average")
    }
    
    print("\nAverage Score: \(averageScore)")
    print("Highest Score: \(highestScore)")
    print("Lowest Score: \(lowestScore)")
}
processStudentScores()

//8
import Foundation
func isPalindrome(_ text: String) -> Bool {
    let cleanedText = text
        .lowercased()
        .filter { $0.isLetter }
    return cleanedText == String(cleanedText.reversed())
}
print("Enter a string to check if it's a palindrome:")
if let input = readLine() {
    if isPalindrome(input) {
        print("\"\(input)\" is a palindrome.")
    } else {
        print("\"\(input)\" is not a palindrome.")
    }
} else {
    print("Invalid input.")
}


//9
import Foundation
func add(_ a: Double, _ b: Double) -> Double {
    return a + b
}
func subtract(_ a: Double, _ b: Double) -> Double {
    return a - b
}
func multiply(_ a: Double, _ b: Double) -> Double {
    return a * b
}
func divide(_ a: Double, _ b: Double) -> Double? {
    if b == 0 {
        print("Error: Division by zero is not allowed.")
        return nil
    }
    return a / b
}
func calculator() {
    while true {
        print("Enter the first number (or type 'exit' to quit):", terminator: " ")
        guard let firstInput = readLine() else {
            print("Invalid input.")
            continue
        }
        if firstInput.lowercased() == "exit" {
            print("Exiting the calculator.")
            return
        }
        guard let firstNumber = Double(firstInput) else {
            print("Invalid input. Please enter a valid number.")
            continue
        }

        print("Enter the second number (or type 'exit' to quit):", terminator: " ")
        guard let secondInput = readLine() else {
            print("Invalid input.")
            continue
        }
        
        if secondInput.lowercased() == "exit" {
            print("Exiting the calculator.")
            return
        }
        guard let secondNumber = Double(secondInput) else {
            print("Invalid input. Please enter a valid number.")
            continue
        }
        print("Choose an operation (+, -, *, /):", terminator: " ")
        guard let operation = readLine() else {
            print("Invalid input.")
            continue
        }
        switch operation {
        case "+":
            let result = add(firstNumber, secondNumber)
            print("Result: \(firstNumber) + \(secondNumber) = \(result)")
        case "-":
            let result = subtract(firstNumber, secondNumber)
            print("Result: \(firstNumber) - \(secondNumber) = \(result)")
        case "*":
            let result = multiply(firstNumber, secondNumber)
            print("Result: \(firstNumber) * \(secondNumber) = \(result)")
        case "/":
            if let result = divide(firstNumber, secondNumber) {
                print("Result: \(firstNumber) / \(secondNumber) = \(result)")
            }
        default:
            print("Invalid operation. Please choose +, -, *, or /.")
        }

        print()
    }
}
calculator()

//10
import Foundation
func hasUniqueCharacters(_ text: String) -> Bool {
    var characterSet = Set<Character>()
    for character in text {
        if characterSet.contains(character) {
            return false
        }
        characterSet.insert(character)
    }
    return true
}
func main() {
    print("Enter a string to check for unique characters:")
    if let input = readLine() {
        if hasUniqueCharacters(input) {
            print("The string \"\(input)\" has all unique characters.")
        } else {
            print("The string \"\(input)\" does not have all unique characters.")
        }
    } else {
        print("Invalid input.")
    }
}
main()

