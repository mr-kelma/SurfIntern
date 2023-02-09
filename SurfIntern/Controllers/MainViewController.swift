//
//  MainViewController.swift
//  SurfIntern
//
//  Created by Valery Keplin on 7.02.23.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    //infinite scrolling
    private let infiniteScrollingMultiplier: Int = 100
    
    private let horizontalPaddingInCell: CGFloat = 24
    private let verticalPaddingInCell: CGFloat = 12
    private let directionModel = DirectionModel.shared
    private lazy var customView = view as? MainView
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = MainView(frame: .zero)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        customView?.firstDirectionsCollectionView.dataSource = self
        customView?.firstDirectionsCollectionView.delegate = self
        customView?.secondDirectionsCollectionView.dataSource = self
        customView?.secondDirectionsCollectionView.delegate = self
        subscribeCustomViewAction()
    }
    
    //infinite scrolling
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        prepareInfiniteScrolling()
//    }
    
    // MARK: - Methods
    
    //infinite scrolling
//    private func prepareInfiniteScrolling() {
//        let indexPath = IndexPath(row: directionModel.directions.count * infiniteScrollingMultiplier / 2, section: 0)
//        customView?.firstDirectionsCollectionView.scrollToItem(at: indexPath, at: .left, animated: false)
//    }
    
    private func subscribeCustomViewAction() {
        customView?.didPressedButtonRequest = {
            self.showMessage()
        }
    }
    private func showMessage() {
        let alert = UIAlertController(title: C.Alert.title, message: C.Alert.message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: C.Alert.addActionTitle, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - Protocols: UICollectionViewDelegate, UICollectionViewDataSource

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return directionModel.directions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else { return UICollectionViewCell() }
        cell.configureCellWith(direction: directionModel.directions[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        directionModel.redefineDirections(index: indexPath.row)
        customView?.firstDirectionsCollectionView.reloadData()
        customView?.secondDirectionsCollectionView.reloadData()
    }
}

// MARK: - Protocols: UICollectionViewDelegateFlowLayout

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = directionModel.directions[indexPath.row].direction
        let font = UIFont.systemFont(ofSize: 14, weight: .regular)
        let width = collectionView.bounds.width - collectionView.contentInset.left - collectionView.contentInset.right
        let labelSize = text.boundingRect(with: CGSize(width: width, height: .greatestFiniteMagnitude), options: [.usesLineFragmentOrigin], attributes: [.font: font], context: nil)
        return CGSize(width: labelSize.width + horizontalPaddingInCell * 2, height: labelSize.height + verticalPaddingInCell * 2)
    }
}
