//
//  MyAsycImage.swift
//  SoulMusic
//
//  Created by 文静 on 2022/8/27.
//

import Foundation
import SwiftUI
import Combine
import UIKit

struct MyAsyncImage<Placeholder: View> : View{
    @StateObject private var loader: ImageLoader
    private let placeholder : Placeholder
    private let image : (UIImage) -> Image
    init(url:URL,
         @ViewBuilder placeholder : ()->Placeholder,
         @ViewBuilder image : @escaping (UIImage) -> Image = Image.init(uiImage: )
    ){
        self.placeholder = placeholder()
        self.image = image
        _loader = StateObject(wrappedValue: ImageLoader(url: url, cache: Environment(\.imageCache).wrappedValue))
    }
    var body: some View{
        Group{
            if loader.image != nil{
                image(loader.image!)
                    .circleImage(width: 81, height: 81)
            }else{
                placeholder
            }
        }
        .onAppear{
            loader.Load()
        }
    }
}

struct ImageCacheKey : EnvironmentKey{
    static let defaultValue: ImageCache = CacheTemporary()
}

extension EnvironmentValues{
    var imageCache : ImageCache{
        get{self[ImageCacheKey.self]}
        set{self[ImageCacheKey.self] = newValue}
    }
}

protocol ImageCache{
    subscript(_url:URL) -> UIImage?{get set}
}

struct CacheTemporary : ImageCache{
    private let cache = NSCache<NSURL, UIImage>()
    
    subscript(_ key: URL) -> UIImage? {
        get{cache.object(forKey: key as NSURL)}
        set{newValue == nil ? cache.removeObject(forKey: key as NSURL): cache.setObject(newValue!, forKey: key as NSURL)}
    }
}

class ImageLoader : ObservableObject{
    @Published var image : UIImage?
    private var isLoading = false
    private var url : URL
    private var cache : ImageCache?
    private var cancellable : AnyCancellable?
    private static var imageProcessing = DispatchQueue(label: "image-processing")
    
    init(url : URL, cache : ImageCache? = nil){
        self.url = url
        self.cache = cache
    }
    
    deinit{
        cancellable?.cancel()
    }
    
    func Load(){
        guard !isLoading else{return}
        
        if let image = cache?[url] {
            self.image = image
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map{
                UIImage(data: $0.data)
            }
            .replaceError(with: nil)
            .handleEvents(receiveSubscription: {
                [weak self] _ in self?.onStart()}
                , receiveOutput: {
                [weak self] in self?.cache($0)}
                , receiveCompletion: {
                [weak self] _ in self?.onFinish()}
                , receiveCancel: {
                [weak self] in self?.onFinish()})
            .subscribe(on: ImageLoader.imageProcessing)
            .receive(on: DispatchQueue.main)
            .sink{[weak self] in self?.image = $0}
    }
    func onStart(){
        isLoading = true
    }
    func onFinish(){
        isLoading = false
    }
    func cache(_ image: UIImage?){
        image.map{cache?[url] = $0}
    }
}
