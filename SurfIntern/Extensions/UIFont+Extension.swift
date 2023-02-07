//
//  UIFont+Extension.swift
//  SurfIntern
//
//  Created by Valery Keplin on 7.02.23.
//

import Foundation

import UIKit

enum FontWeight: String {
    case bold = "SF-Pro-Display-Bold"
    case regular = "SF-Pro-Display-Regular"
}

extension UIFont {
    static func sfProDisplay(style: FontWeight.RawValue, size: CGFloat) -> UIFont {
        let style = style
        guard let sfProDisplay = UIFont(name: style, size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return sfProDisplay
    }
}
