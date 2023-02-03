//
//  ViewController.swift
//  SurfIntern
//
//  Created by Valery Keplin on 3.02.23.
//

import UIKit

class MainViewController: UIViewController {

    let background = UIImageView(image: UIImage(named: "background"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        view.addSubview(background)
    }
}
