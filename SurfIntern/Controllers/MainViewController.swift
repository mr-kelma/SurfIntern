//
//  MainViewController.swift
//  SurfIntern
//
//  Created by Valery Keplin on 7.02.23.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var customView = view as? MainView
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = MainView(frame: .zero)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        subscribeCustomViewAction()
    }
    
    // MARK: - Public methods
    
    
    
    // MARK: - Private methods
    
    private func subscribeCustomViewAction() {
        customView?.didPressedButtonRequest = {
            self.showAlert()
       }
   }
    
    private func showAlert() {
        let alert = UIAlertController(title: C.Alert.title, message: C.Alert.message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: C.Alert.addActionTitle, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
