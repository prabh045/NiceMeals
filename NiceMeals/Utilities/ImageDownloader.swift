//
//  ImageDownloader.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 08/11/24.
//

import SwiftUI

protocol ImageDownloaderProtocol {
    func fetchImage(for url: URL?) async -> Image
}

struct ImageDownloader: ImageDownloaderProtocol {
    private var imageCache = NSCache<NSString,NSData>()
    func fetchImage(for url: URL?) async -> Image {
        guard let url else {
            return Image(Constants.placeholderIcon)
        }
        if let imageData = imageCache.object(forKey: NSString(string: "\(url)")) as? Data {
            guard let uiImage = UIImage(data: imageData) else {
                return Image(Constants.placeholderIcon)
            }
            let image = Image(uiImage: uiImage)
            return image
        }
        let urlRequest = URLRequest(url: url)
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            guard let uiImage = UIImage(data: data) else {
                return Image(Constants.placeholderIcon)
            }
            imageCache.setObject(NSData(data: data), forKey: NSString(string: "\(url)"))
            let image = Image(uiImage: uiImage)
            return image
        }
        catch(let error){
            print("some error occured \(error.localizedDescription)")
            return Image(Constants.placeholderIcon)
        }
    }
}
