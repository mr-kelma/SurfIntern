//
//  CustomCollectionViewCell.swift
//  SurfIntern
//
//  Created by Valery Keplin on 8.02.23.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier: String = C.identifier
    
    private let cornerRadiusCell: CGFloat = 12
    
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
    
    func configureCellWith(direction: Direction) {
        directionLabel.text = direction.label
        
        if direction.condition == Condition.notSelected {
            directionLabel.textColor = UIColor.AppColors.dark
            contentView.backgroundColor = UIColor.AppColors.lightGrey
        } else {
            directionLabel.textColor = .white
            contentView.backgroundColor = UIColor.AppColors.dark
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
