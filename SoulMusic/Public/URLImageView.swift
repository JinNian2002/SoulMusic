//
//  URLImageView.swift
//  SoulMusic
//
//  Created by 文静 on 2022/8/28.
//

import SwiftUI

enum LoadingState{
    case loading
    case success
    case failure
}
struct URLImageView: View {
    func Loading(imageurl: String) async throws -> Data{
        try await withCheckedThrowingContinuation{(continuation: CheckedContinuation<Data,Error>) in
            guard let imageURL = URL(string: imageurl) else {return}
            
            URLCache.shared.diskCapacity = 1024*1024*800
            URLCache.shared.memoryCapacity = 1024*1024*800
            let cache = URLCache.shared
            let request = URLRequest(url: imageURL, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 30.0)
            if let data = cache.cachedResponse(for: request)?.data{
                continuation.resume(returning: data)
                self.state = .success
            }else{
                URLSession.shared.dataTask(with: request) { data, rsp, error in
                    if let data = data, let rsp = rsp{
                        let cacheData = CachedURLResponse(response: rsp, data: data)
                        cache.storeCachedResponse(cacheData, for: request)
                        continuation.resume(returning: data)
                        self.state = .success
                    }else{
                        self.state = .failure
                    }
                }
                .resume()
            }
            let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first
            print("缓存地址：\(path)")
        }
    }
    
    @State var state : LoadingState = .loading
    @State var imageurl : String
    @State var imagedata : Data = Data()
    
    init(url: String){
        self.imageurl = url
    }
    
    var body: some View {
        Group{
            switch state {
            case .loading:
                ProgressView()
            case .success:
                Image(uiImage: UIImage(data: imagedata)!)
                    .circleImage(width: 100, height: 100)
            case .failure:
                Text("失败")
            }
        }
        .task {
            Task{
                try await imagedata = Loading(imageurl: imageurl)
            }
        }
    }
}
