//
//  CacheSpriteManager.swift
//  Swothie
//
//  Created by Passavee Losripat on 22/2/2567 BE.
//

import Foundation
import SwiftUI

class ImageCache {
    static let shared = ImageCache()
    private init() {}
    
    var cache: [String: UIImage] = [:]
    
    func getImage(forKey key: String) -> UIImage? {
        return cache[key]
    }
    
    func setImage(_ image: UIImage, forKey key: String) {
        cache[key] = image
    }
    
    @MainActor func preloadImages() {
        let allFruit: [String] = ["Avocado", "Peach", "Mango"]
        for data in otData{
            for fruit in allFruit {
                let key:String = fruit + data.message
                let newImage = ImageRenderer(content: PlantTowerEnemyView(sign: data, imageName: fruit))
                if let imageForCache = newImage.uiImage{
                    ImageCache.shared.setImage(imageForCache, forKey: key)
                }
            }
        }
    }
}
