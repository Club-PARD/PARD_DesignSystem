//
//  File.swift
//  
//
//  Created by 김하람 on 6/26/24.
//

import UIKit

public final class ModalBuilder {
    private var title: String?
    private var body: String?
    private var buttonType: ModalButtonType?

    public init() {}

    public func add(title: String) -> Self {
        self.title = title
        return self
    }

    public func add(body: String) -> Self {
        self.body = body
        return self
    }

    public func add(button: ModalButtonType) -> Self {
        self.buttonType = button
        return self
    }
    
    // 파라미터로 받은 view를 화면에 표시한다.
    public func show(on viewController: UIViewController) {
        let modal = ModalViewController()
        modal.configurePopup(title: title, body: body, button: buttonType)
        modal.modalPresentationStyle = .overCurrentContext
        modal.modalTransitionStyle = .crossDissolve

        viewController.present(modal, animated: true)
    }
}
