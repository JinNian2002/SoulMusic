//
//  ARcommunityView.swift
//  SoulMusic
//
//  Created by ZZZS on 22.8.22.
//

import SwiftUI
import UIKit
import RealityKit
import AVFoundation
struct ARcommunityView: View {
    @Binding var arshow : Bool
    var body: some View {
            return ARContainer().edgesIgnoringSafeArea(.all)
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

struct ARContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        // 在墙上放一个电视 可以播放视频
        let arView = ARView(frame: .zero)
        //定义一个电视 包括壳，屏幕
        let dimensions:SIMD3<Float>=[1.23,0.046,0.7]
        let housingmesh = MeshResource.generateBox(size: dimensions)
        let housingmat = SimpleMaterial(color:.black,roughness: 0.4,isMetallic: false)
        let housingenity = ModelEntity(mesh:housingmesh,materials: [housingmat])
        //定义屏幕属性
        let screenmesh = MeshResource.generatePlane(width:dimensions.x, depth: dimensions.z)
        let screenmat = SimpleMaterial(color: .white,roughness: 0.2,isMetallic: false)
        let screenentity = ModelEntity(mesh:screenmesh,materials: [screenmat])
        screenentity.name = "tvscreen"
        housingenity.addChild(screenentity) //组装
        screenentity.setPosition([0,dimensions.y/2+0.01,0], relativeTo: housingenity)
        //在arrive中添加锚点
        let anchor = AnchorEntity(plane: .vertical)
        anchor.addChild(housingenity)
        arView.scene.addAnchor(anchor)
        //让电视支持手势操作
        arView.enabletapgesture()
        housingenity.generateCollisionShapes(recursive: true)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

extension ARView{
    //定义一个手势识别器
    func enabletapgesture(){
        let tapgesture = UITapGestureRecognizer(target: self, action:#selector(handletap(recognize:)))
        self.addGestureRecognizer(tapgesture)
    }
    //确保点击的是电视
    @objc func handletap(recognize:UITapGestureRecognizer){
        let taplocation = recognize.location(in: self)
        if let entity = self.entity(at:taplocation ) as?ModelEntity,entity.name
            == "tvscreen"{
            //播放视频 调用avfoundation
            loadvideomaterial(for:entity)
            
        }
    }
    
    func loadvideomaterial(for entity:ModelEntity){
        let asset=AVAsset(url: Bundle.main.url(forResource: "test", withExtension: "mp4")!)
        let playeritem = AVPlayerItem(asset: asset)
        let player = AVPlayer()
        entity.model?.materials = [VideoMaterial(avPlayer: player)]
        player.replaceCurrentItem(with: playeritem)
        player.play()
    }
    
}
struct ARcommunityView_Previews: PreviewProvider {
    static var previews: some View {
        ARcommunityView(arshow: .constant(false))
            .environmentObject(ClientData(FromOutMyClient: initMyClientData()))
    }
}
