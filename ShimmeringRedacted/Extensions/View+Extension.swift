//
//  View+Extension.swift
//  ShimmeringRedacted
//
//  Created by Neftali Samarey on 9/27/22.
//

import SwiftUI

public extension View {

    // Glimmer View Extension
    @ViewBuilder
    func glimmering(active: Bool = true, duration: Double = 1.5, bounce: Bool = false) -> some View {
        if active {
            modifier(Glimmer(duration: duration, bounce: bounce))
        } else {
            self
        }
    }
}
