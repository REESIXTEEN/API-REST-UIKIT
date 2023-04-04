//
//  Models.swift
//  MarvelHeroes
//
//  Created by Pablo Gómez on 17/3/23.
//

import Foundation

// MARK: - Welcome
struct Characters: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let offset, limit, total, count: Int
    let results: [ResultCharacter]
}

// MARK: - Result
struct ResultCharacter: Codable, Identifiable, Equatable {
    let id: Int
    let name, description: String
    let modified: String
    let thumbnail: Thumbnail
    
    static func ==(lhs: ResultCharacter, rhs: ResultCharacter) -> Bool {
        return lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.description == rhs.description &&
            lhs.modified == rhs.modified &&
            lhs.thumbnail == rhs.thumbnail
    }
//    let resourceURI: String
//    let comics, series: Comics
//    let stories: Stories
//    let events: Comics
//    let urls: [URLElement]
}

// MARK: - Comics
//struct Comics: Codable {
//    let available: Int
//    let collectionURI: String
//    let items: [ComicsItem]
//    let returned: Int
//}

// MARK: - ComicsItem
//struct ComicsItem: Codable {
//    let resourceURI: String
//    let name: String
//}
//
//// MARK: - Stories
//struct Stories: Codable {
//    let available: Int
//    let collectionURI: String
//    let items: [StoriesItem]
//    let returned: Int
//}
//
//// MARK: - StoriesItem
//struct StoriesItem: Codable {
//    let resourceURI: String
//    let name: String
//    let type: ItemType
//}
//
//enum ItemType: String, Codable {
//    case cover = "cover"
//    case empty = ""
//    case interiorStory = "interiorStory"
//}

// MARK: - Thumbnail
struct Thumbnail: Codable, Equatable {
    let path: String
    let thumbnailExtension: Extension
    
    static func ==(lhs: Thumbnail, rhs: Thumbnail) -> Bool {
        return lhs.path == rhs.path &&
            lhs.thumbnailExtension == rhs.thumbnailExtension
    }

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

enum Extension: String, Codable {
    case gif = "gif"
    case jpg = "jpg"
}

// MARK: - URLElement
//struct URLElement: Codable {
//    let type: URLType
//    let url: String
//}
//
//enum URLType: String, Codable {
//    case comiclink = "comiclink"
//    case detail = "detail"
//    case wiki = "wiki"
//}





// MARK: - CharacterSerie
struct CharacterSeries: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: DataClassSeries
}

// MARK: - DataClass
struct DataClassSeries: Codable {
    let offset, limit, total, count: Int
    let results: [ResultSeries]
}

// MARK: - Result
struct ResultSeries: Codable, Identifiable, Equatable {
    let id: Int
    let title: String
    let description: String?
//    let startYear, endYear: Int
//    let rating, type: String
    let modified: String
    let thumbnail: Thumbnail
    
    static func ==(lhs: ResultSeries, rhs: ResultSeries) -> Bool {
        return lhs.id == rhs.id &&
            lhs.title == rhs.title &&
            lhs.description == rhs.description &&
            lhs.modified == rhs.modified &&
            lhs.thumbnail == rhs.thumbnail
    }
    
}
