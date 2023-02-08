//
//  CustomCollectionViewCell.swift
//  SurfIntern
//
//  Created by Valery Keplin on 8.02.23.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var cellIndex: Int?
    
    private let cornerRadiusCell: CGFloat = 12
    
    static let identifier: String = C.identifier
    
    private lazy var directionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.AppColors.dark
        label.textAlignment = .center
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor.AppColors.lightGrey
        setupSubviews()
        makeConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.directionLabel.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func configureCellWith(index: Int) {
        cellIndex = index
        directionLabel.text = directions[cellIndex ?? 0].direction
    }
    
    //This method will not work correctly with infinite scrolling (shifts the condition)
    func changeCellCondition(directionCondition: Condition) {
        if directionCondition == Condition.notSelected {
            directionLabel.textColor = .white
            contentView.backgroundColor = UIColor.AppColors.dark
        } else {
            directionLabel.textColor = UIColor.AppColors.dark
            contentView.backgroundColor = UIColor.AppColors.lightGrey
        }
    }
    
    private func setupSubviews() {
        contentView.addSubview(directionLabel)
        contentView.layer.cornerRadius = cornerRadiusCell
    }
    
    private func makeConstraints() {
        directionLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        directionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        directionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        directionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
}
