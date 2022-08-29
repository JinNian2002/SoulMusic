//
//  RealityComposerView.swift
//  SoulMusic
//
//  Created by 文静 on 2022/8/29.
//

import SwiftUI
import RealityKit

struct RealityComposerView : View {
    @Binding var arshow : Bool
    var body: some View {
        return ARrealityViewContainer().edgesIgnoringSafeArea(.all)
            .overlay(
                VStack{
                    FullScreenView(publishshow: $arshow, fullScreentitle: "AR社区", screenbutton: "      ")
                        .background(.ultraThinMaterial)
                    Spacer()
                    HStack(alignment: .bottom){
                        HStack{
                            Image("upload_25")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24)
                        }
                        .circleIcon(width: 54, height: 54)
                        Spacer()
                        VStack(spacing: 12){
                            HStack{
                                Image("share_20_dm")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24)
                            }
                            .circleIcon(width: 54, height: 54)
                            HStack{
                                Image("star")
                            }
                            .circleIcon(width: 54, height: 54)
                            HStack{
                                Image("message_20_dm")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24)
                            }
                            .circleIcon(width: 54, height: 54)
                            HStack{
                                Image("heart_20_nsel_dm")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24)
                            }
                            .circleIcon(width: 54, height: 54)
                            HStack{
                                Image("volume_25")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24)
                            }
                            .circleIcon(width: 54, height: 54)
                        }
                    }
                    .padding(24)
                }
            )
    }
}

struct ARrealityViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! MusicParty.load场景()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct RealityComposerView_Previews : PreviewProvider {
    static var previews: some View {
        RealityComposerView(arshow: .constant(false))
    }
}
#endif

func createRealityURL(filename: String,
                      fileExtension: String,
                      sceneName:String) -> URL? {
    // Create a URL that points to the specified Reality file.
    guard let realityFileURL = Bundle.main.url(forResource: filename,
                                               withExtension: fileExtension) else {
        print("Error finding Reality file \(filename).\(fileExtension)")
        return nil
    }

    // Append the scene name to the URL to point to
    // a single scene within the file.
    let realityFileSceneURL = realityFileURL.appendingPathComponent(sceneName,
                                                                    isDirectory: false)
    return realityFileSceneURL
}

func loadRealityComposerScene (filename: String,
                                fileExtension: String,
                                sceneName: String) -> (Entity & HasAnchoring)? {
    guard let realitySceneURL = createRealityURL(filename: filename,
                                                 fileExtension: fileExtension,
                                                 sceneName: sceneName) else {
        return nil
    }
    let loadedAnchor = try? Entity.loadAnchor(contentsOf: realitySceneURL)

    return loadedAnchor
}
