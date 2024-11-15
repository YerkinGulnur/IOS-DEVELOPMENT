//
//  FilmViewController.swift
//  TabbedFaves
//
//  Created by Гулнур  on 16.11.2024.
//

import UIKit

class FilmViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    let films: [Film] = [
        Film(title: "Pulp Fiction", author: "Quentin Tarantino", genre: "Crime/Drama", poster: #imageLiteral(resourceName: "f1"), description: "Pulp Fiction is a cult classic that intertwines multiple stories of crime, redemption, and dark humor. With its nonlinear storytelling and unforgettable characters, Quentin Tarantino’s masterpiece is a genre-defining film."),
        Film(title: "Avatar", author: "James Cameron", genre: "Sci-Fi/Adventure", poster: #imageLiteral(resourceName: "f2"), description: "Avatar is a visually stunning sci-fi epic set on Pandora, a lush alien world. Jake Sully, a paraplegic former Marine, becomes part of an indigenous community and must decide between following orders or protecting their home."),
        Film(title: "Forrest Gump", author: "Robert Zemeckis", genre: "Drama/Romance", poster: #imageLiteral(resourceName: "f3"), description: "Forrest Gump is the heartwarming tale of a simple man with an extraordinary journey through life, touching pivotal moments in American history and inspiring those around him."),
        Film(title: "The Shawshank Redemption", author: "Frank Darabont", genre: "Drama", poster: #imageLiteral(resourceName: "f4"), description: "The Shawshank Redemption is a powerful story of hope and resilience, following Andy Dufresne, a banker wrongfully imprisoned, as he forges friendships and uncovers a path to freedom."),
        Film(title: "Parasite", author: "Bong Joon-ho", genre: "Thriller/Drama", poster: #imageLiteral(resourceName: "f5"), description: "Parasite is a genre-bending thriller that explores class disparity and greed. The film follows a poor family that infiltrates a wealthy household, leading to unexpected and shocking consequences."),
        Film(title: "Inglourious Basterds", author: "Quentin Tarantino", genre: "War/Drama", poster: #imageLiteral(resourceName: "f6"), description: "Inglourious Basterds is a bold reimagining of World War II, following a group of Jewish-American soldiers on a mission to bring down the Nazi regime. With sharp dialogue and intense scenes, it’s a Tarantino classic."),
        Film(title: "La La Land", author: "Damien Chazelle", genre: "Romance/Musical", poster: #imageLiteral(resourceName: "f7"), description: "La La Land is a modern musical that celebrates love, dreams, and sacrifice. Aspiring actress Mia and jazz musician Sebastian navigate their ambitions and relationship in this visually enchanting film."),
        Film(title: "Coco", author: "Lee Unkrich", genre: "Animation/Family", poster: #imageLiteral(resourceName: "f8"), description: "Coco is a heartwarming animated film that celebrates family and tradition. Young Miguel ventures into the Land of the Dead to uncover the truth about his family's history and pursue his passion for music."),
        Film(title: "Mad Max: Fury Road", author: "George Miller", genre: "Action/Adventure", poster: #imageLiteral(resourceName: "f9"), description: "Mad Max: Fury Road is an adrenaline-fueled post-apocalyptic action film. Max and Furiosa team up to escape a tyrannical warlord in a thrilling, high-octane chase across the desert."),
        Film(title: "The Grand Budapest Hotel", author: "Wes Anderson", genre: "Comedy/Drama", poster: #imageLiteral(resourceName: "f10"), description: "The Grand Budapest Hotel is a whimsical comedy that chronicles the adventures of a legendary concierge and his protégé. With its vibrant visuals and quirky humor, Wes Anderson’s film is a delight.")
    ]

    
    @IBOutlet weak var filmTable: UITableView!
    
    private var currentFilmAt: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filmTable.dataSource = self
        filmTable.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        films.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmCell") as! FilmCell
        let film = films[indexPath.row]
        cell.poster.image = film.poster
        cell.title.text = film.title
        cell.author.text = film.author
        cell.genre.text = film.genre
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToFilmDetail" {
            let destVC = segue.destination as? FilmDetailsViewController
            if let currentFilmAt = currentFilmAt {
                destVC?.configure(with: films[currentFilmAt])
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentFilmAt = indexPath.row
        performSegue(withIdentifier: "goToFilmDetail", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
