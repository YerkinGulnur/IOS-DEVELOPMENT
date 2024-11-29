//
//  NetworkManager.swift
//  SuperheroRandomizer
//
//  Created by Гулнур  on 29.11.2024.
//

import Foundation
import Alamofire

protocol NetworkManagerDelegate{
    func onHeroDidFetch(_ hero: [Superhero])
}

struct NetworkManager{
    private let api = "https://akabab.github.io/superhero-api/api/all.json"
    var delegate: NetworkManagerDelegate?
    
    func fetchSuperheroes(){
        AF.request(api).responseDecodable(of: [Superhero].self){ response in
            switch response.result {
            case .success(let heroes):
                self.delegate?.onHeroDidFetch(heroes)
            case .failure(let error):
                print("Error fetching data: \(error)")
            }
        }
    }
}
