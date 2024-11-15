//
//  MusicViewController.swift
//  TabbedFaves
//
//  Created by Гулнур  on 16.11.2024.
//

import UIKit

class MusicViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    private var songs: [Music] = [
        Music(title: "Happier Than Ever", author: "Billie Eilish", genre: "Alternative", poster: #imageLiteral(resourceName: "m1"), description: "'Happier Than Ever' by Billie Eilish is a raw and emotional track that transitions from soft vulnerability to explosive catharsis. With its haunting lyrics and powerful delivery, the song explores themes of heartbreak, betrayal, and self-empowerment."),
        Music(title: "Someone You Loved", author: "Lewis Capaldi", genre: "Pop Ballad", poster: #imageLiteral(resourceName: "m2"), description: "'Someone You Loved' is a poignant ballad by Lewis Capaldi, capturing the pain of losing someone dear. With its heartfelt lyrics and soulful melody, the song resonates deeply with listeners, making it an emotional standout."),
        Music(title: "Shallow", author: "Lady Gaga & Bradley Cooper", genre: "Pop Rock", poster: #imageLiteral(resourceName: "m3"), description: "'Shallow', the iconic duet from *A Star is Born*, features Lady Gaga and Bradley Cooper delivering a stirring performance. This track explores vulnerability and connection, with its soaring chorus and raw emotion."),
        Music(title: "Bohemian Rhapsody", author: "Queen", genre: "Rock", poster: #imageLiteral(resourceName: "m4"), description: "'Bohemian Rhapsody' by Queen is a legendary rock opera combining elements of ballad, opera, and hard rock. With its iconic melodies and Freddie Mercury’s stunning vocals, it remains a timeless masterpiece."),
        Music(title: "Stay", author: "The Kid LAROI & Justin Bieber", genre: "Pop", poster: #imageLiteral(resourceName: "m5"), description: "'Stay' is a catchy pop hit by The Kid LAROI and Justin Bieber. Its upbeat tempo and heartfelt lyrics explore the longing to hold onto a relationship despite challenges."),
        Music(title: "Believer", author: "Imagine Dragons", genre: "Alternative Rock", poster: #imageLiteral(resourceName: "m6"), description: "'Believer' by Imagine Dragons is a powerful rock anthem about personal growth and resilience. With its driving beat and energetic vocals, the song motivates listeners to embrace their struggles."),
        Music(title: "Rolling in the Deep", author: "Adele", genre: "Soul", poster: #imageLiteral(resourceName: "m7"), description: "'Rolling in the Deep' by Adele is a soulful anthem of heartbreak and empowerment. With its rich vocals and dramatic instrumentation, it remains one of Adele’s most iconic tracks."),
        Music(title: "Clocks", author: "Coldplay", genre: "Alternative", poster: #imageLiteral(resourceName: "m8"), description: "'Clocks' by Coldplay features mesmerizing piano riffs and introspective lyrics. The song’s ethereal sound and reflective tone make it a standout in Coldplay’s discography."),
        Music(title: "Shape of You", author: "Ed Sheeran", genre: "Pop", poster: #imageLiteral(resourceName: "m9"), description: "'Shape of You' by Ed Sheeran is a global hit blending pop and tropical house influences. Its catchy beat and playful lyrics make it perfect for the dance floor."),
        Music(title: "Sunflower", author: "Post Malone & Swae Lee", genre: "Hip-Hop", poster: #imageLiteral(resourceName: "m10"), description: "'Sunflower', featured in *Spider-Man: Into the Spider-Verse*, is a mellow hip-hop track by Post Malone and Swae Lee. Its soothing rhythm and relatable lyrics make it a fan favorite.")
    ]

    @IBOutlet weak var musicTable: UITableView!
    
    private var currentMusicAt: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        musicTable.dataSource = self
        musicTable.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicCell") as! MusicCell
        let music = songs[indexPath.row]
        cell.poster.image = music.poster
        cell.title.text = music.title
        cell.author.text = music.author
        cell.genre.text = music.genre
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToMusicDetail" {
            let destVC = segue.destination as? MusicDetailsViewController
            if let currentMusicAt = currentMusicAt {
                destVC?.configure(with: songs[currentMusicAt])
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentMusicAt = indexPath.row
        performSegue(withIdentifier: "goToMusicDetail", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
