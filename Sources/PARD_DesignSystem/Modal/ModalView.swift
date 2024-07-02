//
//  File.swift
//  
//
//  Created by 김하람 on 6/26/24.
//

import UIKit

public enum ModalButtonType {
    case confirm(
        title: String,
        action: (() -> Void)?
    )
    case cancellable(
        cancelButtonTitle: String,
        confirmButtonTitle: String,
        cancelButtonAction: (() -> Void)?,
        confirmButtonAction: (() -> Void)?
    )
    case noButton
}

final class PardModalView: UIStackView {
    private let titleLabel = UILabel()
    private let bodyLabel = UILabel()
    private let cancelButton = UIButton()
    private let confirmButton = UIButton()
    private let buttonsStackView = UIStackView()

    private var cancelButtonAction: (() -> Void)?
    private var confirmButtonAction: (() -> Void)?
    private var dismissAction: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateComponents(
        title: String,
        body: String,
        button: ModalButtonType?,
        dismissAction: (() -> Void)?
    ) {
        self.titleLabel.text = title
        self.titleLabel.textColor = .pard.gra
        self.bodyLabel.text = body
        self.bodyLabel.textColor = .white
        self.dismissAction = dismissAction
        switch button {
        case .confirm(let title, let action):
            confirmButton.setTitle(title, for: .normal)
            confirmButtonAction = action
            cancelButton.removeFromSuperview()
        case .cancellable(
            let cancelButtonTitle,
            let confirmButtonTitle,
            let cancelButtonAction,
            let confirmButtonAction
        ):
            cancelButton.setTitle(cancelButtonTitle, for: .normal)
            confirmButton.setTitle(confirmButtonTitle, for: .normal)
            self.cancelButtonAction = cancelButtonAction
            self.confirmButtonAction = confirmButtonAction
        case .noButton:
            buttonsStackView.removeFromSuperview()
        case nil:
            buttonsStackView.removeFromSuperview()
        }

        if title.isEmpty {
            titleLabel.removeFromSuperview()
        }

        if body.isEmpty {
            bodyLabel.removeFromSuperview()
        }
    }

    @objc private func didTapLeftButton() {
        if let cancelButtonAction {
            cancelButtonAction()
        }
        dismissAction?()
    }

    @objc private func didTapRightButton() {
        if let confirmButtonAction {
            confirmButtonAction()
        }
        dismissAction?()
    }

    private func setupViews() {
        setupSubviews()
        setupContainerStackView()
        setupButtons()
        setupLabels()
    }

    private func setupContainerStackView() {
        addGestureRecognizer(UITapGestureRecognizer())
        backgroundColor = .pard.blackBackground
        isLayoutMarginsRelativeArrangement = true
        directionalLayoutMargins = .init(top: 20, leading: 20, bottom: 20, trailing: 20)
        alignment = .center
        layer.cornerRadius = 8
        layer.borderColor = UIColor.pard.gra.cgColor
        layer.borderWidth = 1
        spacing = 30
        axis = .vertical
    }

    private func setupSubviews() {
        addArrangedSubview(titleLabel)
        addArrangedSubview(bodyLabel)
        addArrangedSubview(buttonsStackView)
        buttonsStackView.addArrangedSubview(cancelButton)
        buttonsStackView.addArrangedSubview(confirmButton)
    }

    private func setupButtons() {
        cancelButton.layer.cornerRadius = 30
        confirmButton.titleLabel?.font = .systemFont(ofSize: 16)
        cancelButton.backgroundColor = .pard.blackCard
        cancelButton.tintColor = .pard.gray30
        cancelButton.setTitleColor(.white, for: .normal)
        cancelButton.addTarget(self, action: #selector(didTapLeftButton), for: .touchUpInside)

        confirmButton.layer.cornerRadius = 30
        confirmButton.titleLabel?.font = .systemFont(ofSize: 16)
        confirmButton.backgroundColor = .pard.gra
        confirmButton.tintColor = .white
        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.addTarget(self, action: #selector(didTapRightButton), for: .touchUpInside)

        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.spacing = 16
        buttonsStackView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40).isActive = true
        buttonsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40).isActive = true
    }

    private func setupLabels() {
        titleLabel.numberOfLines = .zero
        bodyLabel.numberOfLines = .zero
        titleLabel.font = .systemFont(ofSize: 20)
        bodyLabel.font = .systemFont(ofSize: 18)
    }
}
