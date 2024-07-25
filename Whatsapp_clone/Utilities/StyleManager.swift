//
//  StyleManager.swift
//  Whatsapp_clone
//
//  Created by Hariharan R S on 22/07/24.
//

import SwiftUI
import UIKit

protocol ColorStyleProtocol{
    var backgroundColor: Color { get }
    var invertBackground: Color { get }
    var tintColor: Color { get }
    var placeholderText: Color { get }
    var moodyBlue: Color { get }
    var secondaryBackground: Color { get }
    var lightGray: Color { get }
    var primary: Color { get }
    var chipForeground: Color { get }
    var chipBackground: Color { get }
    var chipUnselectBackground: Color { get }
    var appColor: Color { get }
}

struct StyleManager {
    static var colorStyle: ColorStyleProtocol = Colors()
}

struct Colors: ColorStyleProtocol {
    
    var invertBackground: Color {
        return .primary
    }
    
    var backgroundColor: Color {
        return Color(.systemBackground)
    }
    
    var tintColor: Color {
        return Color.white
    }
    
    var placeholderText: Color {
        let uiColor = UIColor.placeholderText
        return Color(uiColor: uiColor)
    }
    
    var moodyBlue: Color {
        let uiColor = UIColor(cgColor: CGColor(red: 0.49, green: 0.46, blue: 0.8, alpha: 1.0))
        return Color(uiColor: uiColor)
    }
    
    var secondaryBackground: Color {
        let uiColor = UIColor.secondarySystemBackground
        return Color(uiColor: uiColor)
    }
    
    var lightGray: Color {
        let uiColor = UIColor.lightGray
        return Color(uiColor: uiColor)
    }
    
    var primary: Color {
        let uiColor = UIColor.setAppearance(dark: .white, light: .black)
        return Color(uiColor: uiColor)
    }
    
    private var darkGreen: UIColor {
        return UIColor(red: CGFloat(0x15) / 255, green: CGFloat(0x60) / 255, blue: CGFloat(0x3E) / 255, alpha: 1.0) /// Dark
    }
    
    private var lightGreen: UIColor {
        return UIColor(red: CGFloat(0xD0) / 255, green: CGFloat(0xFE) / 255, blue: CGFloat(0xCF) / 255, alpha: 1.0) /// Light
    }
    
    var chipForeground: Color {
        let uiColor = UIColor.setAppearance(dark: lightGreen, light: darkGreen)
        return Color(uiColor: uiColor)
    }
    
    var chipBackground: Color {
        let uiColor = UIColor.setAppearance(dark: darkGreen, light: lightGreen)
        return Color(uiColor: uiColor)
    }
    
    private var chipLightBackground: UIColor {
        return UIColor(red: CGFloat(0xF4) / 255, green: CGFloat(0xF4) / 255, blue: CGFloat(0xF4) / 255, alpha: 1)
    }
    
    var chipUnselectBackground: Color {
        let uiColor = UIColor.setAppearance(dark: UIColor.lightGray, light: chipLightBackground)
        return Color(uiColor: uiColor)
    }
    
    var appColor: Color {
        return Color(uiColor: UIColor(red: CGFloat(0x1D) / 255, green: CGFloat(0xAB) / 255, blue: CGFloat(0x61) / 255, alpha: 1))
    }
}

extension UIColor {
    public static func setAppearance(dark: UIColor,light: UIColor) -> UIColor {
        return UIColor {(trait) -> UIColor in
            if trait.userInterfaceStyle == .dark {
                return dark
            } else {
                return light
            }
        }
    }
    
    public static func setColor(dark: UIColor,light: UIColor) -> UIColor {
        return .setAppearance(dark: dark, light: light)
    }
}

