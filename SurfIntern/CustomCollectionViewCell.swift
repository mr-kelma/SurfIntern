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
    
    weak var delegate: CustomCollectionViewCelllDelegate?
    
    private lazy var fieldLabel: UILabel = {
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func configureCellWith(index: Int) {
        cellIndex = index
        fieldLabel.text = C.fieldsOfStudy[cellIndex ?? 0]
    }
    
    private func setupSubviews() {
        contentView.addSubview(fieldLabel)
        contentView.layer.cornerRadius = cornerRadiusCell
    }
    
    private func makeConstraints() {
        fieldLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        fieldLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        fieldLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        fieldLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    //MARK: - Action
    
}




