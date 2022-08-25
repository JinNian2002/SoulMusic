//
//  ContentView.swift
//  bigtest
//
//  Created by 杨军说 on 2022/8/23.
//

import SwiftUI
import RealityKit
import ARKit
import FocusEntity
struct ARmakerView : View {
    @State var ispalcementenabled =  false  //界面切换按钮
    @State var selectedmodel: modelmanger?
    @State var modelconfirmedforplacement: modelmanger?
    
      var models: [modelmanger] = {
        let filemanager = FileManager.default
        guard let path = Bundle.main.resourcePath,let files = try?
                filemanager.contentsOfDirectory(atPath: path) else {
            return []
        }
        var availabelmodels: [modelmanger] = []
        for  filename in files where filename.hasSuffix("usdz"){
            let modelname = filename.replacingOccurrences(of: ".usdz", with: "")
            let model = modelmanger(modelname: modelname)
            availabelmodels.append(model)
            
        }
        return availabelmodels
        
    }()
    @Binding var armakeshow : Bool//页面开关
    var body: some View {
        ZStack(alignment: .bottom){
            ARViewContainer(modelconfirmedforplacement: self.$modelconfirmedforplacement)
                .ignoresSafeArea(.all)
            if self.ispalcementenabled{
                palcementbuttonsview(isplacementenabled: self.$ispalcementenabled,selectedmodels:self.$selectedmodel,modelconfirmedforplacement: self.$modelconfirmedforplacement) //加载按钮
            }
            else {
                VStack{
                    ZStack{
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width, height: 100)
                            .foregroundColor(Color("Surface"))
                            .ignoresSafeArea()
                        FullScreenView(publishshow: $armakeshow, fullScreentitle: "AR文件制作", screenbutton: "        ")
                            .offset(y: -25)//背景色失效的妥协
                    }
                    Spacer()
                    modelpickerview(isplacementenabled: self.$ispalcementenabled, selectedmodel: self.$selectedmodel, models: self.models)
                        .background(.black)
                        //加载模型
                }
            }
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    @Binding var modelconfirmedforplacement:modelmanger?
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = customarview(frame: .zero)//ARView(frame: .zero)
       
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        if let model = self.modelconfirmedforplacement{
            if let modelentity = model.modelentity{
                print("debug:adding model to scene - \(model.modelname)")
                let anchorentity = AnchorEntity(plane: .any)
                anchorentity.addChild(modelentity.clone(recursive: true))
                uiView.scene.addAnchor(anchorentity)
                
            } else{
                print("debug:unable to load  modelentity for- \(model.modelname)")
            }
           
            DispatchQueue.main.async {
                self.modelconfirmedforplacement = nil
            }
    }
    
 }
    
}
class customarview:ARView{
    let focussquare = FESquare()
    required init(frame framerect: CGRect){
        super.init(frame: framerect)
        focussquare.viewDelegate = self
        focussquare.delegate = self
        focussquare.setAutoUpdate(to: true)
        self.setuparview()
    }
    @objc required dynamic init?(coder decoder: NSCoder){
        fatalError("error")
    }
    func setuparview(){
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal,.vertical]
        config.environmentTexturing = .automatic
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh){
            config.sceneReconstruction = .mesh
        }
        self.session.run(config)
        
    }
}
extension customarview: FEDelegate{
    func toTrackingState() {
         print("tracking")
    }
    func toInitializingState() {
        print("initializing")
    }
}
struct modelpickerview: View{  // 模型栏创建
    @Binding var isplacementenabled: Bool
    @Binding var selectedmodel: modelmanger?
    
    var models: [modelmanger]
    
    var body:some View{
        ScrollView(.horizontal,showsIndicators: false){
            HStack(spacing: 30){
ForEach(0 ..< self.models.count){index
                    in
    Button(action:{
        print("debug: selected model with name:\(self.models[index].modelname)")
        self.selectedmodel = self.models[index]
        self.isplacementenabled = true
    }) {
        Image(uiImage:self.models[index].image).resizable().frame(height: 80).aspectRatio(1/1,contentMode: .fit).background(Color.white).cornerRadius(12)
    }.buttonStyle(PlainButtonStyle())
                }
            }
        }
        .padding(20)
        
    }
    
}
struct palcementbuttonsview: View{  //按钮创建
    @Binding var isplacementenabled: Bool
    @Binding var selectedmodels: modelmanger?
    @Binding var modelconfirmedforplacement:modelmanger?
    var body : some View {
        HStack{
            //取消按钮
            Button(action: {print("debug: model placement cancled.")
                
                self.resetolacementparamenters()
            }){
                Image(systemName: "xmark").frame(width: 60, height: 60).font(.title).background(Color.white.opacity(0.75)).cornerRadius(30).padding(20).foregroundColor(.white)
            }
        //确定按钮
            Button(action: {print("debug: model placement confirmed.")
                self.modelconfirmedforplacement = self.selectedmodels
                self.resetolacementparamenters()            }){
                    Image(systemName: "checkmark").frame(width: 60, height: 60).font(.title).background(Color.white.opacity(0.75)).cornerRadius(30).padding(20).foregroundColor(.white)
            }
            
        }
        
    }

    func resetolacementparamenters(){
        self.isplacementenabled = false
        self.selectedmodels = nil
    }
}

