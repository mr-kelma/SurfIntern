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
    
    private lazy var linePadding: CGFloat = 12
    private lazy var sidePadding: CGFloat = 20
    private lazy var topPadding: CGFloat = 24
    private lazy var bottomPadding: CGFloat = 78
    private lazy var heightButton: CGFloat = 60
    private lazy var widhtButton: CGFloat = 219
    
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
        addSubview(questionLabel)
        addSubview(buttonRequest)
    }
    
    func makeConstraints() {
        titelLabel.topAnchor.constraint(equalTo: topAnchor, constant: topPadding).isActive = true
        titelLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: sidePadding).isActive = true
        
        firstDescriptionLabel.topAnchor.constraint(equalTo: titelLabel.bottomAnchor, constant: linePadding).isActive = true
        firstDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: sidePadding).isActive = true
        firstDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -sidePadding).isActive = true
        
        questionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -bottomPadding).isActive = true
        questionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: sidePadding).isActive = true
        
        buttonRequest.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -bottomPadding + 20).isActive = true
        buttonRequest.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -sidePadding).isActive = true
        buttonRequest.heightAnchor.constraint(equalToConstant: heightButton).isActive = true
        buttonRequest.widthAnchor.constraint(equalToConstant: widhtButton).isActive = true
    }
    
    //MARK: - Action
    
    @objc private func sendButtonTapped(_ sender: UIButton) {
        didPressedButtonRequest?()
    }
    
}
