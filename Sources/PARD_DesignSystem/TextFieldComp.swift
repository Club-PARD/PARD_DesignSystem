//
//  TextFieldComp.swift
//
//
//  Created by 김하람 on 3/3/24.
//

import UIKit

public final class TextFieldComp: UITextField {
    private var didTapHandler: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
    }

    public convenience init(
        placeHolder: String,
        didTapHandler: @escaping () -> Void
    ) {
        self.init(frame: .zero)
        self.backgroundColor = .pard.blackCard
    }

    @objc
    private func didTapButton() {
        didTapHandler?()
    }
}
