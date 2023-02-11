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
    private let heightFirstDirectionsCollection: CGFloat = 44
    private let heightSecondDirectionsCollection: CGFloat = 102
    private let heightButton: CGFloat = 60
    private let widhtButton: CGFloat = 219
    
    //UI elements are arranged from top to bottom display on the screen
    
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
    
    private var firstFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 12
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    lazy var firstDirectionsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: firstFlowLayout)
        collectionView.register(CustomCollectionViewCell.self,
                                forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
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
    
    private var secondFlowLayout: LeftAlignedCollectionViewFlowLayout = {
        let layout = LeftAlignedCollectionViewFlowLayout()
        return layout
    }()
    
    lazy var secondDirectionsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: secondFlowLayout)
        collectionView.register(CustomCollectionViewCell.self,
                                forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
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
    
    //MARK: - Action
    
    @objc private func sendButtonTapped(_ sender: UIButton) {
        didPressedButtonRequest?()
    }
    
    // MARK: - Methods
    
    func addNewItems() {
        addSubviewNewItems()
        makeConstraintsNewItems()
    }
    
    func removeSubviewNewItems() {
        secondDescriptionLabel.removeFromSuperview()
        secondDirectionsCollectionView.removeFromSuperview()
    }
    
    private func addSubview() {
        addSubview(titelLabel)
        addSubview(firstDescriptionLabel)
        addSubview(firstDirectionsCollectionView)
        addSubview(questionLabel)
        addSubview(buttonRequest)
    }
    
    private func addSubviewNewItems() {
        addSubview(secondDescriptionLabel)
        addSubview(secondDirectionsCollectionView)
    }
    
    func makeConstraints() {
        titelLabel.topAnchor.constraint(equalTo: topAnchor, constant: topPadding).isActive = true
        titelLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontaPadding).isActive = true
        
        firstDescriptionLabel.topAnchor.constraint(equalTo: titelLabel.bottomAnchor, constant: lineSpacing).isActive = true
        firstDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontaPadding).isActive = true
        firstDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontaPadding).isActive = true
        
        firstDirectionsCollectionView.topAnchor.constraint(equalTo: firstDescriptionLabel.bottomAnchor, constant: lineSpacing).isActive = true
        firstDirectionsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontaPadding).isActive = true
        firstDirectionsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        firstDirectionsCollectionView.heightAnchor.constraint(equalToConstant: heightFirstDirectionsCollection).isActive = true
        
        questionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -bottomPadding).isActive = true
        questionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontaPadding).isActive = true
        
        buttonRequest.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -bottomPadding + 20).isActive = true
        buttonRequest.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontaPadding).isActive = true
        buttonRequest.heightAnchor.constraint(equalToConstant: heightButton).isActive = true
        buttonRequest.widthAnchor.constraint(equalToConstant: widhtButton).isActive = true
    }
    
    func makeConstraintsNewItems() {
        secondDescriptionLabel.topAnchor.constraint(equalTo: firstDirectionsCollectionView.bottomAnchor, constant: lineSpacing).isActive = true
        secondDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontaPadding).isActive = true
        secondDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontaPadding).isActive = true
        
        secondDirectionsCollectionView.topAnchor.constraint(equalTo: secondDescriptionLabel.bottomAnchor, constant: lineSpacing).isActive = true
        secondDirectionsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontaPadding).isActive = true
        secondDirectionsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        secondDirectionsCollectionView.heightAnchor.constraint(equalToConstant: heightSecondDirectionsCollection).isActive = true
    }
}
