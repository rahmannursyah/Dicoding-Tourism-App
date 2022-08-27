//
//  TempatWisataDetailController.swift
//  DicodingBelajarMembuatAppIOS
//
//  Created by Rahmannur Rizki Syahputra on 26/08/22.
//

import Foundation
import UIKit

class TempatWisataDetailController: UIViewController {
	
	@IBOutlet weak var detailImageView: UIImageView!
	@IBOutlet weak var tempatWisataTitleLbl: UILabel!
	@IBOutlet weak var tempatWisataLbl: UILabel!
	@IBOutlet weak var letakTitleLbl: UILabel!
	@IBOutlet weak var letakLbl: UILabel!
	@IBOutlet weak var descLbl: UILabel!
	
	var tempatWisataDetailImage: UIImage?
	var tempatWisataDetailData: Place?
	
	override func viewDidLoad() {
		super.viewDidLoad()
//		self.view.backgroundColor = .clear
		setupView()
	}
	
	func setupView() {
		detailImageView.image = tempatWisataDetailImage
		tempatWisataLbl.text = tempatWisataDetailData?.name
		letakLbl.text = tempatWisataDetailData?.address
		descLbl.text = tempatWisataDetailData?.placeDescription
		self.title = tempatWisataDetailData?.name
	}
}
