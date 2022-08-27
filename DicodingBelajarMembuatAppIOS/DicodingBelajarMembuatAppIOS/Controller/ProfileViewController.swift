//
//  ProfileViewController.swift
//  DicodingBelajarMembuatAppIOS
//
//  Created by Rahmannur Rizki Syahputra on 27/08/22.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
	
	@IBOutlet weak var profileImgView: UIImageView!
	@IBOutlet weak var profileNameLbl: UILabel!
	@IBOutlet weak var profileEmailLbl: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
	}
	
	func setupView() {
		self.title = "Profile"
		
		setCircularImgView()
		
		profileImgView.image = UIImage(named: "profile")
		profileNameLbl.text = "Rahmannur Rizki Syahputra"
		profileEmailLbl.text = "srahmannur@gmail.com"
	}
	
	func setCircularImgView() {
		profileImgView.layer.cornerRadius = (profileImgView.frame.size.width) / 2
		profileImgView.clipsToBounds = true
	}
}
