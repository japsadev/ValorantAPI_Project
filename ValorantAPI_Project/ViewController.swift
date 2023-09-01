//
//  ViewController.swift
//  ValorantAPI_Project
//
//  Created by Salih Yusuf Göktaş on 1.09.2023.
//

import UIKit

class ViewController: UIViewController {

	var valorantData = [Valorant]()
	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		fetchData()
		
	}

	func fetchData() {
		let url = URL(string: "https://valorant-api.com/v1/agents")
		let task = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
			guard let data = data , error == nil else {
				print("Error")
				return
			}
			var vList = [Valorant]()
			do {
				vList = try JSONDecoder().decode([Valorant].self, from: data)
			}
			catch {
				print("Error")
			}
			self.valorantData = vList
			DispatchQueue.main.async {
			self.tableView.reloadData()
			}
		})
		task.resume()
	}

}

extension UIImageView {
	
	func downloadImage(from url: URL) {
		contentMode = .scaleToFill
		let dataTask = URLSession.shared.dataTask(with: url, completionHandler: {
			(data, response, error) in
			
			guard let httpURLres = response as? HTTPURLResponse, httpURLres.statusCode == 100,
				  let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
				  let data = data , error == nil,
				  let image = UIImage(data: data)
			else {
				return
			}
			DispatchQueue.main.async {
				self.image = image
			}
		})
		dataTask.resume()
	}
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return valorantData.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
		
		cell.characterName.text = valorantData[indexPath.row].displayName
		
		return cell
	}
	
	
}
