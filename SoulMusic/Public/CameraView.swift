//
//  CameraView.swift
//  SoulMusic
//
//  Created by ZZZS on 19.8.22.
//

import SwiftUI
import AVFoundation
import CoreML
import UIKit

struct CameraView: View{
    let model = MobileNetV2()
    @State var classificationLabel: String = ""
    @StateObject var Camera : CameraModel = CameraModel()
    var body: some View{
        ZStack{
            CameraPreview(camera: Camera)
                .ignoresSafeArea(.all)
            VStack{
                NavView(isshowfront: false, Navtitle: "聆物")
                    .background(.ultraThinMaterial)
                Spacer()
                Image("scan")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width * 2 / 3)
                VStack{
                    Text(classificationLabel)
                        .padding()
                        .font(.largeTitle)
                }
                .background(.white)
                Spacer()
                HStack{
                    Spacer()
                    HStack{
                        Image("info_dm")
                    }
                    .circleIcon(width: 50, height: 50)
                    .shadow(color: Color("Primary").opacity(0.5), radius: 10, x: 0, y: 0)
                    Spacer()
                    HStack{
                        Image("camera")
                    }
                    .circleIcon(width: 60, height: 60)
                    .shadow(color: Color("Primary").opacity(0.5), radius: 10, x: 0, y: 0)
                    .onTapGesture {
                        Camera.takePic()
                        classifyImage()
                    }
                    Spacer()
                    Button{
                        if !Camera.isSaved{
                            Camera.SavePic()
                        }
                        
                    }label: {
                        HStack{
                            Image("flash")
                        }
                        .circleIcon(width: 50, height: 50)
                        .shadow(color: Color("Primary").opacity(0.5), radius: 10, x: 0, y: 0)
                    }
                    Spacer()
                }
                .padding(.bottom, UIScreen.main.bounds.height / 10)
            }
            
        }
        .onAppear{
            Camera.Check()
        }
    }
    func classifyImage() {
        guard let image = UIImage(named: "store"),
              let resizedImage = image.resizeImageTo(size:CGSize(width: 224, height: 224)),
              let buffer = resizedImage.convertToBuffer() else {return}
        
        let outputimage = try? model.prediction(image: buffer)
        
        if let outputimage = outputimage {
            self.classificationLabel = outputimage.classLabel
        }
    }
}

class CameraModel: NSObject, ObservableObject, AVCapturePhotoCaptureDelegate{
    
    
    @Published var session = AVCaptureSession()
    @Published var output = AVCapturePhotoOutput()
    @Published var preview : AVCaptureVideoPreviewLayer!
    @Published var isTaken : Bool = false
    @Published var isSaved : Bool = false
    @Published var picData : Data = Data()
    func Check(){
        switch AVCaptureDevice.authorizationStatus(for: .video){
        case .authorized:
            self.SetUp()
            return
            
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { (Status) in
                if Status{
                    self.SetUp()
                }
            }
            return
        case .denied:
            return
        default:
            return
        }
        
    }
    func SetUp(){
        do{
            self.session.beginConfiguration()
            let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)!
            let input = try AVCaptureDeviceInput(device: device)
            if self.session.canAddInput(input){
                self.session.addInput(input)
            }
            if self.session.canAddOutput(self.output){
                self.session.addOutput(self.output)
            }
            self.session.commitConfiguration()
        }catch{
            print(error)
        }
        
    }
    
    func takePic(){
        DispatchQueue.global(qos: .background).async {
            self.output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
            self.session.stopRunning()
            DispatchQueue.main.async {
                withAnimation {
                    self.isTaken = true
                }
            }
        }
    }
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard error != nil else {return}
        print("take photo")
        guard let imagedata = photo.fileDataRepresentation() else {return}
        self.picData = imagedata
    }
    
    func SavePic(){
        guard self.picData.count != 0 else {return}
        let image = UIImage(data: self.picData)!
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        self.isSaved = true
        print("saved Success")
    }
}



struct CameraPreview : UIViewRepresentable{
    @ObservedObject var camera: CameraModel
    
    func makeUIView(context: Context) -> some UIView {
        let UIView = UIView(frame: UIScreen.main.bounds)
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = UIView.frame
        camera.preview.videoGravity = .resizeAspectFill
        UIView.layer.addSublayer(camera.preview)
        camera.session.startRunning()
        return UIView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        return
    }
}
