//
//  MainViewController.swift
//  SurfIntern
//
//  Created by Valery Keplin on 7.02.23.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    private let infiniteScrollingMultiplier: Int = 100
    private let horizontalPaddingInCell: CGFloat = 24
    private let verticalPaddingInCell: CGFloat = 12
    private let directionModel: DirectionModel = DirectionModel()
    
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
        prepareCustomLayout()
        subscribeCustomViewAction()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        prepareInfiniteScrolling()
    }
    
    // MARK: - Methods
    
    private func prepareInfiniteScrolling() {
        let indexPath = IndexPath(row: directionModel.directions.count * infiniteScrollingMultiplier / 2, section: 0)
        customView?.firstDirectionsCollectionView.scrollToItem(at: indexPath, at: .left, animated: false)
    }
    
    private func prepareCustomLayout() {
        if let layout = customView?.secondDirectionsCollectionView.collectionViewLayout as? LeftAlignedCollectionViewFlowLayout {
            layout.delegate = self
        }
    }
    
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
        if collectionView == customView?.firstDirectionsCollectionView {
            return directionModel.directions.count * infiniteScrollingMultiplier
        } else {
            return directionModel.directions.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else { return UICollectionViewCell() }
        if collectionView == customView?.firstDirectionsCollectionView {
            cell.configureCellWith(direction: directionModel.directions[indexPath.row % directionModel.directions.count])
        } else {
            cell.configureCellWith(direction: directionModel.directions[indexPath.row])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == customView?.firstDirectionsCollectionView {
            directionModel.checkDirections(index: indexPath.row % directionModel.directions.count)
        } else {
            directionModel.checkDirections(index: indexPath.row)
        }
        
        customView?.firstDirectionsCollectionView.reloadData()
        customView?.secondDirectionsCollectionView.reloadData()
        customView?.firstDirectionsCollectionView.moveItem(at: indexPath, to: IndexPath(row: 0, section: 0))
        customView?.secondDirectionsCollectionView.moveItem(at: indexPath, to: IndexPath(row: 0, section: 0))
    }
}

// MARK: - Protocols: UICollectionViewDelegateFlowLayout

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var text = ""
        if collectionView == customView?.firstDirectionsCollectionView {
            text = directionModel.directions[indexPath.row % directionModel.directions.count].direction
        } else {
            text = directionModel.directions[indexPath.row].direction
        }
        
        let font = UIFont.systemFont(ofSize: 14, weight: .regular)
        let width = collectionView.bounds.width - collectionView.contentInset.left - collectionView.contentInset.right
        let labelSize = text.boundingRect(with: CGSize(width: width, height: .greatestFiniteMagnitude), options: [.usesLineFragmentOrigin], attributes: [.font: font], context: nil)
        return CGSize(width: labelSize.width + horizontalPaddingInCell * 2, height: labelSize.height + verticalPaddingInCell * 2)
    }
}

// MARK: - Protocols: UISheetPresentationControllerDelegate

extension MainViewController: UISheetPresentationControllerDelegate {
    func sheetPresentationControllerDidChangeSelectedDetentIdentifier(_ sheetPresentationController: UISheetPresentationController) {
        customView?.addNewItems()
    }
}

// MARK: - Protocols: UISheetPresentationControllerDelegate

extension MainViewController: LeftAlignedCollectionViewFlowLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, widthForDirectionAtIndexPath indexPath: IndexPath) -> CGFloat {
        let content = directionModel.directions[indexPath.row].direction
        let width = content.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .regular)]).width + horizontalPaddingInCell * 2
        return width
    }
}
