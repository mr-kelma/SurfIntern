//
//  CustomFlowLayout.swift
//  SurfIntern
//
//  Created by Valery Keplin on 9.02.23.
//

import UIKit

protocol LeftAlignedCollectionViewFlowLayoutDelegate: AnyObject {
  func collectionView(_ collectionView: UICollectionView, widthForDirectionAtIndexPath indexPath: IndexPath) -> CGFloat
}

class LeftAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {

    // MARK: - Properties
    
    weak var delegate: LeftAlignedCollectionViewFlowLayoutDelegate?
    
    private let numberOfRows = 2
    private let cellPadding: CGFloat = 6
    
    private var cache: [UICollectionViewLayoutAttributes] = []
    
    private var contentWidth: CGFloat = 0
    
    private var contentHeight: CGFloat {
      guard let collectionView = collectionView else {
        return 0
      }
      let insets = collectionView.contentInset
        return collectionView.bounds.height - (insets.top + insets.bottom)
    }
    
    override var collectionViewContentSize: CGSize {
      return CGSize(width: contentWidth, height: contentHeight)
    }
    
    // MARK: - Methods
    
    override func prepare() {
        guard
        cache.isEmpty,
        let collectionView = collectionView
        else {
          return
      }

      let rowHeight = contentHeight / CGFloat(numberOfRows)
      var yOffset: [CGFloat] = []
        
      for row in 0..<numberOfRows {
        yOffset.append(CGFloat(row) * rowHeight)
      }
      var row = 0
      var xOffset: [CGFloat] = .init(repeating: 0, count: numberOfRows)
        
      for item in 0..<collectionView.numberOfItems(inSection: 0) {
        let indexPath = IndexPath(item: item, section: 0)
          
        let directionWidth = delegate?.collectionView(
          collectionView,
          widthForDirectionAtIndexPath: indexPath) ?? 100
        let width = cellPadding * 2 + directionWidth
        let frame = CGRect(x: xOffset[row],
                           y: yOffset[row],
                           width: width,
                           height: rowHeight)
        let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
          
        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        attributes.frame = insetFrame
          
          cache.append(attributes)
          
        contentWidth = max(contentWidth, frame.maxX)
        xOffset[row] = xOffset[row] + width
          row = row < (numberOfRows - 1) ? (row + 1) : 0
      }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
      var visibleLayoutAttributes: [UICollectionViewLayoutAttributes] = []
      
      for attributes in cache {
        if attributes.frame.intersects(rect) {
          visibleLayoutAttributes.append(attributes)
        }
      }
      return visibleLayoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
      return cache[indexPath.item]
    }
}
