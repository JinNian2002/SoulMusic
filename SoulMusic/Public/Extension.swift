//
//  Extension.swift
//  SoulMusic
//
//  Created by ZZZS on 15.8.22.
//

import Foundation
import SwiftUI

extension Image{
    func circleImage(width: CGFloat, height: CGFloat) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .mask(Circle())
            .frame(width: width, height: height)
            .clipped()
    }
}
