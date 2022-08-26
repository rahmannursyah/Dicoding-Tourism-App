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
	override func viewDidLoad() {
		super.viewDidLoad()
		self.title = "Detail"
		self.view.backgroundColor = .white
	}
}
