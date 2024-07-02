//
//  PopupViewController.swift
//
//
//  Created by 김하람 on 6/29/24.
//

import UIKit

final class ModalViewController: UIViewController {
    private let modalView = PardModalView()
    private let dimmedView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    func configurePopup(
        title: String?,
        body: String?,
        button: ModalButtonType?
    ) {
        modalView.updateComponents(
            title: title ?? "",
            body: body ?? "",
            button: button,
            dismissAction: { [weak self] in
                self?.dismiss(animated: true)
            }
        )
    }

    private func setupViews() {
        view.backgroundColor = .clear
        view.addSubview(dimmedView)

        dimmedView.translatesAutoresizingMaskIntoConstraints = false
        dimmedView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        dimmedView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        dimmedView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        dimmedView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        dimmedView.backgroundColor = UIColor.black.withAlphaComponent(0.3)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapDimmedArea))
        dimmedView.addGestureRecognizer(tapGesture)

        dimmedView.addSubview(modalView)
        modalView.translatesAutoresizingMaskIntoConstraints = false
        modalView.centerXAnchor.constraint(equalTo: dimmedView.centerXAnchor).isActive = true
        modalView.centerYAnchor.constraint(equalTo: dimmedView.centerYAnchor).isActive = true
        modalView.leadingAnchor.constraint(equalTo: dimmedView.leadingAnchor, constant: 24).isActive = true
        modalView.trailingAnchor.constraint(equalTo: dimmedView.trailingAnchor, constant: -24).isActive = true
    }

    @objc func didTapDimmedArea() {
        self.dismiss(animated: true)
    }
}
