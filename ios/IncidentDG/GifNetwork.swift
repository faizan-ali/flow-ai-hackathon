//
//  GifNetwork.swift
//  IncidentDG
//
//  Created by Randy Fong on 9/9/23.
//

import Foundation
import UIKit

// MARK: Model
struct GifIcon: Decodable {
    let name: String
    let url: String
}

struct GifIcons: Decodable {
    let items: [GifIcon]
}

struct GifImage {
    let name: String
    let animatedGif: Data
}

struct GifImages {
    let items: [GifImage]
}


// MARK: Results

enum LoadGifIconsResult {
    case success([GifIcon])
    case failure(String)
}

enum LoadGifImageResult {
    case success(Data)
    case failure(String)
}

enum LoadGifImagesResult {
    case success([GifImage])
    case failure(String)
}

// MARK: Network
    
class GifNetwork {
    init() {}
    func loadData(_ prompt: String) async -> LoadGifIconsResult {
        do {
            let url = URL(string: "https://early-rested-owl.ngrok-free.app/api/items")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let gifIcons = try  JSONDecoder().decode(GifIcons.self, from: data)
            return LoadGifIconsResult.success(gifIcons.items)
        } catch {
            print("Load data error")
            return LoadGifIconsResult.failure("Unable to load GIF Icons data")
        }
        
    }
    
    func loadImage(_ url: URL) async -> LoadGifImageResult {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return LoadGifImageResult.success(data)
        } catch {
            print("Load GIF error")
        }
        
        return LoadGifImageResult.failure("Load Image failure")
    }
    
    func loadImageCollection(_ icons: [GifIcon]) async -> LoadGifImagesResult {
        var gifImages = [GifImage]()
        for item in icons {
            let url = URL(string: item.url)!
            let result: LoadGifImageResult  = await loadImage(url)
            switch result {
            case .success(let image):
                gifImages.append(GifImage(name: item.name, animatedGif: image))
            case .failure:
                return LoadGifImagesResult.failure("Load Image Collection failure")
            }
        }
        return .success(gifImages)
    }
    
    @discardableResult
    func loadDataAndImages(_ prompt: String) async -> [GifImage] {
        let dataResult = await loadData(prompt)
        switch dataResult {
        case .success(let gifIcons):
            let gifImagesResult = await loadImageCollection(gifIcons)
            switch gifImagesResult {
            case .success(let gifImages):
                return gifImages
            case .failure:
                return [GifImage]()
            }
        case .failure:
            print("Error loading data and images")
            return [GifImage]()
        }
    }
}

