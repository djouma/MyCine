//
//  RechercherTableViewController.swift
//  MyCine
//
//  Created by Gbaha Patrick Cazon on 20/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//
//
//  MovieListTableViewController.swift
//  MyCine
//
//  Created by Gbaha Patrick Cazon on 15/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//

import UIKit

class RechercherTableViewController: UITableViewController, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchActive : Bool = false
    var filmData: [Film] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "rechercheResultat")
        
        let film = filmData[indexPath.row]
        if(searchActive) {
            cell.textLabel?.text = film.titre
        }
        
        return cell
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("recherche:")
        print(searchText)
        if filmData.count > 0 {
            filmData.removeAll()
        }
        let request = URLRequest(url: NSURL(string: "https://api.themoviedb.org/3/search/movie?api_key=59573a66a7496ba950f43835c493e9d0&include_adult=false&query="+searchText+"")! as URL)
        do {
            let response: AutoreleasingUnsafeMutablePointer<URLResponse?>? = nil
            let data = try NSURLConnection.sendSynchronousRequest(request, returning: response)
            
            let jsonSerialized = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
            //print(jsonSerialized)
            if let json = jsonSerialized, let films = json["results"] as? [[String:Any]]{
                // print(films)
                for film in films {
                    if let id = film["id"] as? Int, let title = film["title"] as? String, let description = film["overview"] as? String{
                        //print(title)
                        let filmList = Film(id:id, titre:title,description: description)
                        filmData.append(filmList)
                        
                        
                        
                    }
                }
                
            }
        }
        catch{
            print(error)
        }
        
        if(filmData.count == 0){
            searchActive = false;
            print("nul")
        } else {
            searchActive = true;
            print("data")
        }
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     //  let cell = tableView.dequeueReusableCell(withIdentifier: "rechercheResultat", for: indexPath)
     
     let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "rechercheResultat")
     
     let film = filmData[indexPath.row]
     if(searchActive) {
     cell.textLabel?.text = film.titre
     }
     
     return cell
     }*/
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("detail")
        if segue.identifier == "detailRecherche" {
            print("detailREchernce")
            guard let destVC = segue.destination as? DetaiFilmViewController else { fatalError("bad type, expected DetaiFilmViewController") }
            
            guard let cell = sender as? UITableViewCell else { return }
            guard let indexPath = tableView.indexPath(for: cell) else { return }
            
            let currentFilm = filmData[indexPath.row]
            destVC.film = currentFilm
            
            
        }
    }
}
