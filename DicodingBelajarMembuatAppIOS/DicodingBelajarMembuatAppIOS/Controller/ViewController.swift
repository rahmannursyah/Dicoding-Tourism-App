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
	@IBAction func didTappedProfile(_ sender: Any) {
		presentProfileVC()
	}
	
	var tempatWisata: [Place]? {
		didSet {
			tempatWisataTableView.reloadData()
		}
	}
	var tempatWisataImages: [UIImage]? = []
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
	
	func presentProfileVC() {
		let profileVC = UIStoryboard.init(name: "Profile", bundle: Bundle.main).instantiateViewController(withIdentifier: "Profile") as? ProfileViewController
		navigationController?.pushViewController(profileVC ?? ViewController(), animated: true)
	}
}

extension ViewController {
	func fetchTourismData() {
		ApiManager.shared.getTempatWisata { [weak self] result in
			switch result {
			case .success(let place):
				self?.tempatWisata = place
				guard let tempat = self?.tempatWisata else {
					return
				}
				self?.fetchTourismImages(placeData: tempat)
			case .failure(let error):
				self?.errorFetchData = error.localizedDescription
			}
		}
	}
	
	func fetchTourismImages(placeData: [Place]) {
		for index in 0..<(placeData.count) {
			if let urlFromStr = URL(string: placeData[index].image) {
				let resource = ImageResource(downloadURL: urlFromStr)
				KingfisherManager.shared.retrieveImage(with: resource) { [weak self] result in
					DispatchQueue.main.async {
						switch result {
						case .success(let value):
							self?.tempatWisataImages?.append(value.image)
						case .failure(let error):
							print(error.localizedDescription)
						}
					}
				}
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
		
		let detailVC = UIStoryboard.init(name: "TempatWisataDetail", bundle: Bundle.main).instantiateViewController(withIdentifier: "TempatWisataDetail") as? TempatWisataDetailController
		detailVC?.tempatWisataDetailData = tempatWisata?[indexPath.row]
		detailVC?.tempatWisataDetailImage = tempatWisataImages?[indexPath.row]
		navigationController?.pushViewController(detailVC ?? ViewController(), animated: true)
	}
	
}
