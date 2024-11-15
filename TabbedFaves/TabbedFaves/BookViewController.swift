//
//  BookViewController.swift
//  TabbedFaves
//
//  Created by Гулнур  on 16.11.2024.
//

import UIKit

class BookViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    let books: [Book] = [
        Book(title: "The Alchemist", author: "Paulo Coelho", genre: "Philosophical Fiction", poster: #imageLiteral(resourceName: "b1"), description: "The Alchemist tells the story of Santiago, a shepherd boy who dreams of discovering a treasure buried near the Egyptian pyramids. Guided by his recurring dreams and a series of mysterious encounters, Santiago embarks on a journey of self-discovery, learning profound lessons about love, destiny, and the pursuit of one's personal legend."),
        Book(title: "Brave New World", author: "Aldous Huxley", genre: "Science Fiction", poster: #imageLiteral(resourceName: "b2"), description: "In Brave New World, Aldous Huxley imagines a dystopian future where society is controlled through genetic engineering, consumerism, and state-imposed happiness. The novel follows Bernard Marx, a discontented member of this highly regulated society, as he questions the values of his world and discovers the consequences of true individuality."),
        Book(title: "Jane Eyre", author: "Charlotte Brontë", genre: "Romance", poster: #imageLiteral(resourceName: "b3"), description: "Jane Eyre is a classic novel about the life and struggles of an orphaned young woman. Through her journey from a harsh childhood to her time as a governess at Thornfield Hall, Jane confronts issues of love, independence, and morality, ultimately discovering her own strength and resilience."),
        Book(title: "The Picture of Dorian Gray", author: "Oscar Wilde", genre: "Philosophical Fiction", poster: #imageLiteral(resourceName: "рз"), description: "Oscar Wilde’s The Picture of Dorian Gray explores themes of aestheticism, morality, and the nature of the human soul. The story follows Dorian Gray, a handsome young man who makes a Faustian bargain to remain youthful while his portrait ages in his place, reflecting the true consequences of his hedonistic lifestyle."),
        Book(title: "War and Peace", author: "Leo Tolstoy", genre: "Historical Fiction", poster: #imageLiteral(resourceName: "b5 1"), description: "War and Peace is a monumental novel that chronicles the lives of Russian aristocracy during the Napoleonic Wars. Tolstoy intricately weaves themes of love, family, politics, and destiny, creating a timeless exploration of human experience against the backdrop of historical upheaval."),
        Book(title: "Crime and Punishment", author: "Fyodor Dostoevsky", genre: "Psychological Fiction", poster: #imageLiteral(resourceName: "b6"), description: "Crime and Punishment follows the psychological torment of Raskolnikov, a young and impoverished student who commits a murder under the belief that his act is justified. Through his moral struggle and the subsequent investigation, Dostoevsky delves into themes of guilt, redemption, and the complexities of human nature."),
        Book(title: "Animal Farm", author: "George Orwell", genre: "Political Satire", poster: #imageLiteral(resourceName: "b7 1"), description: "Animal Farm is a satirical allegory that critiques totalitarian regimes and the corrupting influence of power. Through the lens of a farm where the animals overthrow their human owner to establish their own government, Orwell delivers a poignant commentary on the cyclical nature of oppression."),
        Book(title: "The Kite Runner", author: "Khaled Hosseini", genre: "Drama", poster: #imageLiteral(resourceName: "b8"), description: "The Kite Runner is a moving story of friendship, betrayal, and redemption set against the backdrop of Afghanistan’s turbulent history. The novel follows Amir, a young boy from a privileged background, as he seeks atonement for a childhood act of cowardice that haunts him into adulthood."),
        Book(title: "The Fault in Our Stars", author: "John Green", genre: "Young Adult", poster: #imageLiteral(resourceName: "b9"), description: "The Fault in Our Stars is a heart-wrenching yet uplifting story about love and loss. It follows Hazel Grace Lancaster, a 16-year-old cancer patient, as she navigates her condition and forms a deep bond with Augustus Waters, a charismatic cancer survivor. Together, they explore life, love, and the meaning of existence in the face of mortality."),
        Book(title: "Little Women", author: "Louisa May Alcott", genre: "Classic", poster: #imageLiteral(resourceName: "d10"), description: "Little Women follows the lives of the four March sisters—Meg, Jo, Beth, and Amy—as they grow up in Civil War-era New England. Through their struggles, triumphs, and close bond, the novel explores themes of family, love, and personal growth.")
    ]
    
    @IBOutlet weak var bookTable: UITableView!
    private var currentBookAt: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookTable.dataSource = self
        bookTable.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell") as! BookCell
        let book = books[indexPath.row]
        cell.poster.image = book.poster
        cell.title.text = book.title
        cell.author.text = book.author
        cell.genre.text = book.genre
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToBookDetail" {
            let destVC = segue.destination as? BookDetailsViewController
            if let currentBookAt = currentBookAt {
                destVC?.configure(with: books[currentBookAt])
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentBookAt = indexPath.row
        performSegue(withIdentifier: "goToBookDetail", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
