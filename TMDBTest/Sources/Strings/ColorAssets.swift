//
//  ColorAssets.swift
//  TMDBTest
//
//  Created by Mario Vanegas on 15/3/24.
//

import Foundation
import SwiftUI

struct ColorAssets {
    static let backgroundColor = "background-color"
    static let defaultAccent = "default-accent"
    static let primaryColor = "primary-color"
    static let primarySolid = "primary-solid"
    static let secondaryColor = "secondary-color"
    static let secondarySolid = "secondary-solid"
    static let tertiaryColor = "tertiary-color"
    static let tertiaryFixed = "tertiary-fixed"
    static let tmdbBackgroundControls = "tmdb-background-controls"
    static let tmdbBlack = "tmdb-black"
    static let tmdbPlaceholder = "tmdb-placeholder"
    static let tmdbShadow = "tmdb-shadow"
}

// Extension returning Color value
extension Color {
    static var backgroundSwiftUIColor: Color {
        Color(ColorAssets.backgroundColor)
    }
    
    static var defaultAccentSwiftUIColor: Color {
        Color(ColorAssets.defaultAccent)
    }
    
    static var primaryColorSwiftUIColor: Color {
        Color(ColorAssets.primaryColor)
    }
    
    static var primarySolidSwiftUIColor: Color {
        Color(ColorAssets.primarySolid)
    }
    
    static var secondaryColorSwiftUIColor: Color {
        Color(ColorAssets.secondaryColor)
    }
    
    static var secondarySolidSwiftUIColor: Color {
        Color(ColorAssets.secondarySolid)
    }
    
    static var tertiaryColorSwiftUIColor: Color {
        Color(ColorAssets.tertiaryColor)
    }
    
    static var tertiaryFixedSwiftUIColor: Color {
        Color(ColorAssets.tertiaryFixed)
    }
    
    static var tmdbBackgroundControlsSwiftUIColor: Color {
        Color(ColorAssets.tmdbBackgroundControls)
    }
    
    static var tmdbBlackSwiftUIColor: Color {
        Color(ColorAssets.tmdbBlack)
    }
    
    static var tmdbPlaceholderSwiftUIColor: Color {
        Color(ColorAssets.tmdbPlaceholder)
    }
    
    static var tmdbShadowSwiftUIColor: Color {
        Color(ColorAssets.tmdbShadow)
    }
}
