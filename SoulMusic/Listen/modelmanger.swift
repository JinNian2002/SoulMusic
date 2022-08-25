//
//  modelmanger.swift
//  bigtest
//
//  Created by 杨军说 on 2022/8/24.
//

import UIKit
import RealityKit
import Combine
class modelmanger{
    var modelname: String
    var image:UIImage
    var modelentity: ModelEntity?
    var cancellable:AnyCancellable? = nil
    init(modelname:String){
        self.modelname = modelname
        self.image = UIImage(named: modelname)!
        let filename = modelname + ".usdz"
        self.cancellable = ModelEntity.loadModelAsync(named:filename).sink(receiveCompletion: {
            loadcompletion  in
            print("debug: unable to load modelentity for modelname:\(self.modelname)")
        }, receiveValue: {
            modelentity in
            self.modelentity = modelentity
            print("debug:sucessfully loaded modelentity for modelname:\(self.modelname)")
        })
    }
}
