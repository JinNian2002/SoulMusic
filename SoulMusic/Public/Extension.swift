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
extension Text{
    func searchButton() -> some View {
        self
            .font(.system(size: 14))
            .foregroundColor(Color("FontSecondary"))
            .padding(.horizontal, 12)
            .padding(.vertical, 4)
            .background(Color("Surface"), in: RoundedRectangle(cornerRadius: 5))
            .padding(1)
            .background(Color("FontSecondary"), in: RoundedRectangle(cornerRadius: 5))
    }
}
extension UINavigationController : UIGestureRecognizerDelegate{
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
#if canImport(UIKit)
extension View {
    func hidekeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
