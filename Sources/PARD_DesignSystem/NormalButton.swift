//
//  NormalButton.swift
//  
//
//  Created by 김하람 on 3/3/24.
//

import UIKit

public final class NormalButton: UIView {
    private let button = UIButton()
    private var didTapHandler: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    public var isEnabled: Bool = true {
        didSet {
            button.isEnabled = isEnabled
            button.backgroundColor = isEnabled ? .pard.primaryBlue : .pard.gray30
        }
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        button.layer.cornerRadius = 4
    }

    public convenience init(
        title: String,
        didTapHandler: @escaping () -> Void,
        font: UIFont
    ) {
        self.init(frame: .zero)
        self.isUserInteractionEnabled = true
        self.addSubview(button)
        button.setTitle(title, for: .normal)
        button.setTitle(title, for: .disabled)
        button.titleLabel?.font = font
        button.setTitleColor(.pard.white100, for: .normal)
        button.setTitleColor(.pard.white100, for: .disabled)
        button.backgroundColor = isEnabled ? .pard.primaryBlue : .pard.gray30
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.topAnchor),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        self.didTapHandler = didTapHandler
    }

    @objc
    private func didTapButton() {
        didTapHandler?()
    }
}
