//
//  MainView.swift
//  SurfIntern
//
//  Created by Valery Keplin on 7.02.23.
//

import UIKit

class MainView: UIView {
    
    // MARK: - Properties
    
    var didPressedButtonRequest: (() -> Void)?
    
    private let lineSpacing: CGFloat = 12
    private let horizontaPadding: CGFloat = 20
    private let topPadding: CGFloat = 24
    private let bottomPadding: CGFloat = 78
    private let heightButton: CGFloat = 60
    private let heightDirectionsCollection: CGFloat = 44
    private let widhtButton: CGFloat = 219
    
    private var flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 12
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    lazy var  directionsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(CustomCollectionViewCell.self,
                                forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var titelLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = UIColor.AppColors.dark
        label.textAlignment = .left
        label.text = C.Labels.titelLabel
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var firstDescriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = UIColor.AppColors.darkGrey
        label.text = C.Labels.firstDescriptionLabel
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var secondDescriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = UIColor.AppColors.darkGrey
        label.text = C.Labels.secondDescriptionLabel
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var questionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.AppColors.darkGrey
        label.text = C.Labels.questionLabel
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var buttonRequest: UIButton = {
        let button = UIButton()
        button.isAccessibilityElement = true
        button.setTitle(C.Labels.buttonRequestLabel, for: .normal)
        button.backgroundColor = UIColor.AppColors.dark
        button.layer.cornerRadius = 30
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        button.addTarget(self, action: #selector(sendButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = UIColor.AppColors.dark
        addSubview()
        makeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func addSubview() {
        addSubview(titelLabel)
        addSubview(firstDescriptionLabel)
        addSubview(directionsCollectionView)
        addSubview(secondDescriptionLabel)
        addSubview(questionLabel)
        addSubview(buttonRequest)
    }
    
    func makeConstraints() {
        titelLabel.topAnchor.constraint(equalTo: topAnchor, constant: topPadding).isActive = true
        titelLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontaPadding).isActive = true
        
        firstDescriptionLabel.topAnchor.constraint(equalTo: titelLabel.bottomAnchor, constant: lineSpacing).isActive = true
        firstDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontaPadding).isActive = true
        firstDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontaPadding).isActive = true
        
        directionsCollectionView.topAnchor.constraint(equalTo: firstDescriptionLabel.bottomAnchor, constant: lineSpacing).isActive = true
        directionsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontaPadding).isActive = true
        directionsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        directionsCollectionView.heightAnchor.constraint(equalToConstant: heightDirectionsCollection).isActive = true
        
        secondDescriptionLabel.topAnchor.constraint(equalTo: directionsCollectionView.bottomAnchor, constant: lineSpacing).isActive = true
        secondDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontaPadding).isActive = true
        secondDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontaPadding).isActive = true
        
        questionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -bottomPadding).isActive = true
        questionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontaPadding).isActive = true
        
        buttonRequest.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -bottomPadding + 20).isActive = true
        buttonRequest.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontaPadding).isActive = true
        buttonRequest.heightAnchor.constraint(equalToConstant: heightButton).isActive = true
        buttonRequest.widthAnchor.constraint(equalToConstant: widhtButton).isActive = true
    }
    
    //MARK: - Action
    
    @objc private func sendButtonTapped(_ sender: UIButton) {
        didPressedButtonRequest?()
    }
}
