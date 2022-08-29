//
//  LoadingView.swift
//  SoulMusic
//
//  Created by 文静 on 2022/8/29.
//

import SwiftUI
import UIKit

struct LoadingView: View {
    static let loadingimages = [UIImage(named: "loading_00000"),
                                UIImage(named: "loading_00001"),
                                UIImage(named: "loading_00002"),
                                UIImage(named: "loading_00003"),
                                UIImage(named: "loading_00004"),
                                UIImage(named: "loading_00005"),
                                UIImage(named: "loading_00006"),
                                UIImage(named: "loading_00007"),
                                UIImage(named: "loading_00008"),
                                UIImage(named: "loading_00009"),
                                UIImage(named: "loading_00010"),
                                UIImage(named: "loading_00011"),
                                UIImage(named: "loading_00012"),
                                UIImage(named: "loading_00013"),
                                UIImage(named: "loading_00014")]
    var body: some View {
        TimelineView(.periodic(from: .now, by: 1 / 30)) { timeline in
            HStack{
                
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
