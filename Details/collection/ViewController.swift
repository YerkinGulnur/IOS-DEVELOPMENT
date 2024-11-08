import UIKit

struct Book {
    let title: String
    let author: String
    let genre: String
    let cover: UIImage
    let description: String?
}

class ViewController: UIViewController {

    let favoriteBooks: [Book] = [
        Book(title: "Сто лет одиночества", author: "Габриэль Гарсиа Маркес", genre: "Магический реализм", cover: UIImage(named: "Сто лет одиночества")!,description: "Сага о семействе Буэндиа, отражающая одиночество и магические моменты их жизни."),
        Book(title: "Война и мир", author: "Лев Толстой", genre: "Исторический роман", cover: UIImage(named: "Война и мир")!,description: "История любви и судьбы нескольких семей на фоне войны с Наполеоном."),
        Book(title: "Анна Каренина", author: "Лев Толстой", genre: "Классика", cover: UIImage(named: "Анна Каренина")!,description: "Трагическая история любви, затрагивающая проблемы семьи и морали."),
        Book(title: "Преступление и наказание", author: "Фёдор Достоевский", genre: "Драма", cover: UIImage(named: "Преступление и наказание")!,description: "Психологический роман о нравственных дилеммах и расплате за убийство."),
        Book(title: "Улисс", author: "Джеймс Джойс", genre: "Модернизм", cover: UIImage(named: "Улисс")!,description: "Эпопея о путешествиях Леопольда Блума по Дублину в течение одного дня."),
        Book(title: "Мастер и Маргарита", author: "Михаил Булгаков", genre: "Мистика", cover: UIImage(named: "Мастер и Маргарита")!,description: "Сатирический роман о визите дьявола в Москву и вечной любви."),
        Book(title: "Гарри Поттер и философский камень", author: "Джоан Роулинг", genre: "Фэнтези", cover: UIImage(named: "Гарри Поттер и философский камень")!,description: "Первая часть истории о мальчике-волшебнике, который узнает о своём магическом наследии."),
        Book(title: "Зов Ктулху", author: "Говард Лавкрафт", genre: "Хоррор", cover: UIImage(named: "Зов Ктулху")!,description: "Жуткий рассказ о древнем существе, живущем под морем и внушающем страх."),
        Book(title: "451 градус по Фаренгейту", author: "Рэй Брэдбери", genre: "Научная фантастика", cover: UIImage(named: "451 градус по Фаренгейту")!,description: "Роман о будущем, где книги сжигают, а мысли контролируются."),
        Book(title: "О дивный новый мир", author: "Олдос Хаксли", genre: "Антиутопия", cover: UIImage(named: "О дивный новый мир")!,description: "Антиутопический мир, где люди утратили свободу под влиянием технологий и социальных контролей."),
            ]
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteBooks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Movies
        let book = favoriteBooks[indexPath.row]
        cell.configure(with: book)
        cell.delegate = self
        return cell
    }
}

extension ViewController: MangasCellDelegate {
    func didTapButton(with book: Book) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailVC = storyboard.instantiateViewController(withIdentifier: "BookDetailViewController") as? BookDetailViewController {
            detailVC.book = book
    
            if navigationController?.topViewController != detailVC {
                navigationController?.pushViewController(detailVC, animated: true)
            }
        }
    }
}

