//
//  ViewController.swift
//  SurfIntern
//
//  Created by Valery Keplin on 3.02.23.
//

import UIKit

class BackgroundViewController: UIViewController {
    
    // MARK: - Properties
    
    private let cornerRadiusSheet: CGFloat = 30
    private lazy var customView = view as? BackgroundView
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = BackgroundView(frame: .zero)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSheet()
    }
    
    // MARK: - Public methods
    
    //
    
    // MARK: - Private methods
    
    private func configureSheet() {
        let mainViewController = MainViewController()
        let spacingNavigationController = UINavigationController(rootViewController: mainViewController)
        spacingNavigationController.isModalInPresentation = true
        
        navigationController?.present(spacingNavigationController, animated: true)
        
        if let sheet = spacingNavigationController.sheetPresentationController {
            sheet.preferredCornerRadius = cornerRadiusSheet
            sheet.detents = [
                .custom(resolver: { context in
                0.4 * context.maximumDetentValue
            }),
                .custom(resolver: { context in
                0.6 * context.maximumDetentValue
            }),
                .large()
            ]
            
        }
    }
}
