//
//  SceneDelegate.swift
//  collection
//
//   Created by Гулнур  on 25.10.2024.
//

import UIKit
struct Book {
    let title: String
    let author: String
    let genre: String
    let cover: UIImage
}
class ViewController: UIViewController {
    let favoriteBooks: [Book] = [
        Book(title: "Сто лет одиночества", author: "Габриэль Гарсиа Маркес", genre: "Магический реализм", cover: UIImage(named: "Сто лет одиночества")!),
        Book(title: "Война и мир", author: "Лев Толстой", genre: "Исторический роман", cover: UIImage(named: "Война и мир")!),
        Book(title: "Анна Каренина", author: "Лев Толстой", genre: "Классика", cover: UIImage(named: "Анна Каренина")!),
        Book(title: "Преступление и наказание", author: "Фёдор Достоевский", genre: "Драма", cover: UIImage(named: "Преступление и наказание")!),
        Book(title: "Улисс", author: "Джеймс Джойс", genre: "Модернизм", cover: UIImage(named: "Улисс")!),
        Book(title: "Мастер и Маргарита", author: "Михаил Булгаков", genre: "Мистика", cover: UIImage(named: "Мастер и Маргарита")!),
        Book(title: "Гарри Поттер и философский камень", author: "Джоан Роулинг", genre: "Фэнтези", cover: UIImage(named: "Гарри Поттер и философский камень")!),
        Book(title: "Зов Ктулху", author: "Говард Лавкрафт", genre: "Хоррор", cover: UIImage(named: "Зов Ктулху")!),
        Book(title: "451 градус по Фаренгейту", author: "Рэй Брэдбери", genre: "Научная фантастика", cover: UIImage(named: "451 градус по Фаренгейту")!),
        Book(title: "О дивный новый мир", author: "Олдос Хаксли", genre: "Антиутопия", cover: UIImage(named: "О дивный новый мир")!),
    ]
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // Perform the segue when a row is selected
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowBookDetails" {
            if let destinationVC = segue.destination as? BookDetailsViewController,
               let indexPath = tableView.indexPathForSelectedRow {
                destinationVC.selectedBook = favoriteBooks[indexPath.row]
            }
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Perform segue on tap
        performSegue(withIdentifier: "ShowBookDetails", sender: nil)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteBooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Movies
        let book = favoriteBooks[indexPath.row]
        cell.configure(with: book)
        return cell
    }
}
