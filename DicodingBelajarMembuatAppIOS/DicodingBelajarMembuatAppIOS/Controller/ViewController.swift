//
//  ViewController.swift
//  DicodingBelajarMembuatAppIOS
//
//  Created by Rahmannur Rizki Syahputra on 25/08/22.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

	@IBOutlet weak var tempatWisataTableView: UITableView!
	
	var tempatWisata: [Place]? {
		didSet {
			tempatWisataTableView.reloadData()
		}
	}
	var errorFetchData: String?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		fetchTourismData()
	
		tempatWisataTableView.delegate = self
		tempatWisataTableView.dataSource = self
	}
	
	func setupView() {
		navigationController?.navigationBar.prefersLargeTitles = true
	}
	
}

extension ViewController {
	func fetchTourismData() {
		ApiManager.shared.getTempatWisata { [weak self] result in
			switch result {
			case .success(let place):
				self?.tempatWisata = place
			case .failure(let error):
				self?.errorFetchData = error.localizedDescription
			}
		}
	}
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tempatWisata?.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? TempatWisataTableViewCell {

			let currData = tempatWisata?[indexPath.row]
			let urlFromStr = URL(string: currData?.image ?? "")
			
			cell.placeImageView.kf.setImage(with: urlFromStr)
			cell.placeLbl.text = currData?.name
			cell.addressLbl.text = currData?.address
			cell.likesLbl.text = "\(currData?.like ?? 0)"
			return cell
		} else {
			return UITableViewCell()
		}
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		
		let detailVC = TempatWisataDetailController()
		navigationController?.pushViewController(detailVC, animated: true)
	}
	
}
