//
//  File.swift
//  
//
//  Created by 김하람 on 3/3/24.
//

import UIKit

// Define a utility to easily create fonts with line heights
extension UIFont {
    func withLineHeight(_ lineHeight: CGFloat) -> UIFont {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = lineHeight
        paragraphStyle.maximumLineHeight = lineHeight
        return self
    }
}

// Define your text styles
let displayLarge = UIFont.systemFont(ofSize: 24, weight: .bold).withLineHeight(28)
let displayMedium = UIFont.systemFont(ofSize: 20, weight: .bold).withLineHeight(24)
let displaySmall = UIFont.systemFont(ofSize: 18, weight: .semibold).withLineHeight(24)

let headlineLarge = UIFont(name: "Pretendard-Bold", size: 16)!.withLineHeight(20)
let headlineMedium = UIFont(name: "Pretendard-SemiBold", size: 16)!.withLineHeight(20)
let headlineSmall = UIFont(name: "Pretendard-SemiBold", size: 14)!.withLineHeight(18)

let titleLarge = UIFont(name: "Pretendard-Medium", size: 14)!.withLineHeight(18)
let titleMedium = UIFont(name: "Pretendard-SemiBold", size: 12)!.withLineHeight(16)
let titleSmall = UIFont(name: "Pretendard-Medium", size: 12)!.withLineHeight(16)
