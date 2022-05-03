//
//  Landmark.swift
//  LearningSwiftForImen
//
//  Created by Mohammad Saghafian on 2022-05-02.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable{
    // All these properties are used to render the data from the JSON file provided by apple
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    // Adding an isFavorite property to the Landmark structure.
    var isFavorite: Bool
    
    // In Landmark.swift, add a Category enumeration and a category property to the Landmark structure. The landmarkData.json file already includes a category value for each landmark with one of these string values. By matching the names in the data file, you can rely on the structure's Codable conformance to load the data
    var category: Category
    enum Category: String, CaseIterable, Codable{
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
