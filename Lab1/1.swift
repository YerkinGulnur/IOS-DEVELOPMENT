//
//  main.swift
//  Lab1
//
//  Created by Гулнур  on 10.09.2024.
//

var firstName: String = "Gulnur"
var lastName: String = "Erkin"
var age: Int = 19
let birthYear: Int = 2004
let currentYear: Int = 2024
let isStudent: Bool = true
var height: Double = 1.67

age = currentYear - birthYear

var hobby: String = "Painting 🎨"
var numberOfHobbies: Int = 3
var favoriteNumber: Int = 7
let isHobbyCreative: Bool = true

var favoriteSport: String = "Basketball 🏀"
var musicalInstrument: String = "Guitar 🎸"

var lifeStory: String = """
My name is \(firstName) \(lastName). I am \(age) years old, born in \(birthYear). I am currently a student.
I enjoy \(hobby), which is a creative hobby. I have \(numberOfHobbies) hobbies in total, including \(favoriteSport) and playing the \(musicalInstrument).
My favorite number is \(favoriteNumber).
"""

print(lifeStory)

var futureGoals: String = "In the future, I want to become a professional iOS developer 💻, travel the world 🌍, and make a positive impact on society 💡."

lifeStory += "\n\(futureGoals)"


print(lifeStory)
