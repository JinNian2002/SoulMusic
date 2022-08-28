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
    @Environment(\.colorScheme) var currentMode
    let model = MobileNetV2()
    @State var classificationLabel: String = ""
    @State var musiclistresult: Bool = false
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
                Spacer()
                HStack{
                    Spacer()
                    HStack{
                        Image("info_dm")
                    }
                    .circleIcon(width: 50, height: 50)
                    .shadow(color: Color("Primary").opacity(0.5), radius: 10, x: 0, y: 0)
                    .onTapGesture {
                        
                    }
                    Spacer()
                    HStack{
                        Image("camera")
                    }
                    .circleIcon(width: 60, height: 60)
                    .shadow(color: Color("Primary").opacity(0.5), radius: 10, x: 0, y: 0)
                    .onTapGesture {
                        Camera.takePic()
                        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                            classifyImage()
                        })
                        musiclistresult = true
                    }
                    Spacer()
                    Button{
                        Camera.OpenFlash()
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
            Camera.Restart()
        }
        .fullScreenCover(isPresented: $musiclistresult) {
            VStack{
                HStack{
                    Image(currentMode == .dark ? "x_24_dm" : "x_24")
                        .padding(12)
                        .onTapGesture {
                            musiclistresult = false
                            Camera.Check()
                            Camera.Restart()
                        }
                    Spacer()
                    Text("聆物歌单")
                        .font(.system(size: 17, weight: .medium))
                    Spacer()
                    Image(currentMode == .dark ? "x_24_dm" : "x_24")
                        .padding(12)
                        .opacity(0)
                }
                Text(classificationLabel)
                Spacer()
            }
        }
    }
    func classifyImage() {
        guard let image = UIImage(data: Camera.picData),
              let resizedImage = image.resizeImageTo(size:CGSize(width: 224, height: 224)),
              let buffer = resizedImage.convertToBuffer() else {return}
        
        let outputimage = try? model.prediction(image: buffer)
        
        if let outputimage = outputimage {
            self.classificationLabel = outputimage.classLabel
        }
    }
}

class CameraModel:NSObject,ObservableObject,AVCapturePhotoCaptureDelegate{
    @Published var session = AVCaptureSession()
    
    @Published var preview : AVCaptureVideoPreviewLayer!
    
    @Published var output = AVCapturePhotoOutput()
    
    @Published var isTaken : Bool = false
    
    @Published var isSaved : Bool = false
    
    @Published var picData : Data  = Data()
    
    @Published var setting:AVCapturePhotoSettings?
    
    @Published var device:AVCaptureDevice!//获取设备:如摄像头
    
    @Published var input:AVCaptureDeviceInput!//输入流
    
    @Published var isflash : Bool = false
    
    @Published var isback : Bool = true
    
    @Published var iswaiting : Bool = false
    
    func Check(){
        switch AVCaptureDevice.authorizationStatus(for: .video){
            case .authorized:
                // 启动
                self.SetUp()
                return
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: .video) { (Status) in
                    if Status{
                        // 启动
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
    
    func ShutDown(){
        self.session.stopRunning()
        self.session.beginConfiguration()
        self.session.removeInput(self.input)
        self.session.removeOutput(self.output)
        self.session.commitConfiguration()
    }
    
    func SetUp(){
        do{
            self.session.beginConfiguration()
            self.device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
               //照片输出设置
            self.setting = AVCapturePhotoSettings.init(format: [AVVideoCodecKey:AVVideoCodecType.jpeg])
          //用输入设备初始化输入
            self.input = try AVCaptureDeviceInput(device: self.device!)
            if(self.session.canAddInput(self.input)){
                self.session.addInput(self.input)
          }
            if(self.session.canAddOutput(self.output)){
                self.session.addOutput(self.output)
           }
            self.session.commitConfiguration()
            self.session.startRunning()
        }catch{
            print(error)
        }
    }
    
    func Restart(){
        DispatchQueue.global(qos: .background).async {
            self.session.startRunning()
            DispatchQueue.main.async {
                withAnimation {
                    self.isTaken = false
                    self.isSaved = false
                }
            }
        }
    }
    
    func ChangeCam()async{
        do{
            if self.device.position == .back{
                let device = AVCaptureDevice.default(.builtInTrueDepthCamera, for: .video, position: .front)
                self.session.beginConfiguration()
                self.session.removeInput(self.input)
                let newinput = try AVCaptureDeviceInput(device: device!)
                if(self.session.canAddInput(newinput)){
                    self.session.addInput(newinput)
                }
                self.session.commitConfiguration()
                self.input = newinput
                self.device = device!
                self.isback = false
            }else{
                let device = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .back)
                self.session.beginConfiguration()
                self.session.removeInput(self.input)
                let newinput = try AVCaptureDeviceInput(device: device!)
                if(self.session.canAddInput(newinput)){
                    self.session.addInput(newinput)
                }
                self.session.commitConfiguration()
                self.input = newinput
                self.device = device!
                self.isback = true
            }
        }catch{
            print(error)
        }
    }
    
    func ChangeWH(){
        
    }
    
    func OpenFlash(){
        self.isflash = !self.isflash//改变闪光灯
        try? self.device.lockForConfiguration()
        if(self.isflash){//开启
            self.device.torchMode = .on
           }else{//关闭
               if self.device.hasTorch {
                   self.device.torchMode = .off//关闭闪光灯
               }
           
           }
        self.device.unlockForConfiguration()
    }
   
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photoSampleBuffer: CMSampleBuffer?, previewPhoto previewPhotoSampleBuffer: CMSampleBuffer?, resolvedSettings: AVCaptureResolvedPhotoSettings, bracketSettings: AVCaptureBracketedStillImageSettings?, error: Error?) {
           let imagedata  =  AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: photoSampleBuffer!, previewPhotoSampleBuffer: previewPhotoSampleBuffer)
           self.picData = imagedata!
    }
    
    func takePic(){
        self.output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
        DispatchQueue.global(qos: .background).async {
            self.session.stopRunning()
            DispatchQueue.main.async {
                withAnimation {
                    self.isTaken = true
                }
            }
        }
    }
    
    func SavePic(){
        let image = UIImage(data: self.picData)!
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
       self.isSaved = true
       print("Saved Successfully...")
    }
}

struct CameraPreview : UIViewRepresentable{
    @ObservedObject var camera : CameraModel
    
    func makeUIView(context: Context) ->  UIView {
        let UIView = UIView(frame: UIScreen.main.bounds)
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = UIView.frame
        camera.preview.videoGravity = .resizeAspectFill
        UIView.layer.addSublayer(camera.preview)
        camera.session.startRunning()
        return UIView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        return
    }
}
