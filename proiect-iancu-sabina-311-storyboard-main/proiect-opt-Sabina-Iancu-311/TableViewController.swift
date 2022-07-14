//
//  TableViewController.swift
//  proiect-opt-Sabina-Iancu-311
//
//  Created by user215930 on 5/1/22.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://randomuser.me/api/"
        getData(from: url)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func getData(from url: String){
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response,  error in
            
            guard let data = data, error == nil else {
                print("Nothing good in that")
                return
            }
            
            var result: Response?
            
            do{
                result = try JSONDecoder().decode(Response.self, from: data)
            }
            catch {
                print("Convertion failes")
            }
            
            guard let json = result else {
                return
            }
            
            print(json.status)
            print(json.results.link)
            print(json.results.participants)
            
        })
            task.resume()
    }

}


struct Response: Codable {
    let results: MyResult
    let status: String
}

struct MyResult: Codable {
    let activity: String
    let participants: Int
    let price: Int
    let link: String
    let key: String
    let accessability: Float
}

extension TableViewController: UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you taped me!")
    }
}

extension TableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for:  indexPath)
        
        cell.textLabel?.text = "Hello word!"
        
        return cell
    }
    
}



