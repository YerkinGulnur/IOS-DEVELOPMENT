//Easy Tasks
//1
let fruits = ["Apple", "Banana", "Cherry", "Date", "Elderberry"]
print(fruits[2])
//2
var favoriteNumbers: Set = [7, 14, 21]
favoriteNumbers.insert(28)
print(favoriteNumbers)
//3
let languages = ["Swift": 2014, "Python": 1991, "Java": 1995]
print(languages["Swift"]!) 
//4
var colors = ["Red","Green","Blue","Yellow"]
colors[1] = "Purple"
print(colors)

//Medium Task
//1
let set1: Set = [1, 2, 3, 4]
let set2: Set = [3, 4, 5, 6]
let intersection = set1.intersection(set2)
print(intersection)
//2
var studentScores = ["Alice": 85, "Bob": 90, "Charlie": 78]
studentScores["Bob"] = 95
print(studentScores)
//3
let array1 = ["apple", "banana"]
let array2 = ["cherry", "date"]
let mergedArray = array1 + array2
print(mergedArray)

//Hard Task
//1
var countryPopulations = ["USA": 331_000_000, "India": 1_380_000_000, "China": 1_410_000_000]
countryPopulations["Brazil"] = 213_000_000
print(countryPopulations)
//2
let setA: Set<String> = ["cat", "dog"]
let setB: Set<String> = ["dog", "mouse"]
let unionSet = setA.union(setB)
let resultSet = unionSet.subtracting(setB)
print(resultSet)

//3
let studentGrades = ["John": [85, 92, 78], "Mary": [88, 79, 93], "Alice": [91, 84, 77]]
print(studentGrades["John"]![1])
