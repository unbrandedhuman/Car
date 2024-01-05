//
//  Extensions.swift
//  Car
//
//  Created by Matthew Smith on 1/3/24.
//

import Foundation
import SwiftUI

#if os(iOS)
  public extension CGFloat {
    static let fullScreenWidth = UIScreen.main.bounds.width
    static let fullScreenHeight = UIScreen.main.bounds.height
  }
#endif

/// Colors of buttons.
public extension Color {
    static let normalButtonColor = Color(red: 0.2, green: 0.2, blue: 0.2)
    static let highlightedButtonColor = Color(
        red: 0.467,
        green: 0.467,
        blue: 0.467
    )
    
    static var neutralColor = Color("black")
}
