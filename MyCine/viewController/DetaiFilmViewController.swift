//
//  DetaiFilmViewController.swift
//  MyCine
//
//  Created by Developer on 17/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//

import UIKit

class DetaiFilmViewController: UIViewController {
    
    
    
    @IBOutlet weak var descriptionFilm: UITextView!
    @IBOutlet weak var titreFilm: UILabel!
    @IBOutlet weak var posterFilm: UIImageView!
    
    var film: Film?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let f = film else { fatalError("No film provided")}
        configure(with: f)
        // Do any additional setup after loading the view.
    }
    private func configure(with film: Film) {
        
        titreFilm.text = film.titre
        descriptionFilm.text = film.description
        
        let base = URL(string: "https://image.tmdb.org/t/p/w185")!
        let completeURL = base.appendingPathComponent(film.image)
        
       // print(completeURL.absoluteURL.absoluteString)
        URLSession.shared.dataTask(with: completeURL) { (data, response, error) in
            
            guard let data = data else { return }
            guard let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self.posterFilm.image = image
            }
            
        }.resume()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
