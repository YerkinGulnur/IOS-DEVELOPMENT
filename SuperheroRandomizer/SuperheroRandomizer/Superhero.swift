//
//  Superhero.swift
//  SuperheroRandomizer
//
//  Created by Гулнур  on 29.11.2024.
//

import Foundation

struct Superhero: Decodable {
    let id: Int
    let name: String
    let slug: String
    let powerstats: Powerstats
    let appearance: Appearance
    let biography: Biography
    let work: Work
    let images: Images

    struct Powerstats: Decodable {
        let intelligence: Int
        let strength: Int
        let speed: Int
        let durability: Int
        let power: Int
        let combat: Int
    }

    struct Appearance: Decodable {
        let gender: String
        let race: String?
        let height: [String]
        let weight: [String]
    }

    struct Biography: Decodable {
        let fullName: String
    }

    struct Work: Decodable {
        let occupation: String
    }

    struct Images: Decodable {
        let lg: String
    }
}
