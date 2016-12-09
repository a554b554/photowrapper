//
//  LastPhotoRetriever.swift
//  AVCam Swift
//
//  Created by chang xiao on 11/7/16.
//  Copyright © 2016 Apple, Inc. All rights reserved.
//

import UIKit
import Photos

struct LastPhotoRetriever {
    func queryLastPhoto(resizeTo size: CGSize?, queryCallback: @escaping ((UIImage?) -> Void)){
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        fetchOptions.fetchLimit = 1 // This is available in iOS 9.
        
        let fetchResult = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: fetchOptions)
        let asset = fetchResult.firstObject! as PHAsset
        let manager = PHImageManager.default()
        
        // If you already know how you want to resize,
        // great, otherwise, use full-size.
        let targetSize = size == nil ? CGSize(width: asset.pixelWidth, height: asset.pixelHeight) : size!
        
        // I arbitrarily chose AspectFit here. AspectFill is
        // also available.
        manager.requestImage(for: asset,
                             targetSize: targetSize,
                             contentMode: .aspectFit,
                             options: nil,
                             resultHandler: { image, info in
                                queryCallback(image)
        })
    }
}
