//
//  ModelData.swift
//  LearningSwiftForImen
//
//  Created by Mohammad Saghafian on 2022-05-02.
//

import Foundation
import Combine


// Declare a new model type that conforms to the Observable object protocol from the combine framework.
// SwiftUI subscribes to you
final class ModelData: ObservableObject{
    // An observable object needs to publish any changes to its data, so that its subscribers can pick up the change
    // We add the @Published attribute to the landmarks array.
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    
    // Adding a computed categories dictionary, with category names as keys, and an array of associated landmarks for each key 
    var categories: [String: [Landmark]]{
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue}
        )
    }
}

var landmarks: [Landmark] = load("landmarkData.json")

func load<T: Decodable>(_ filename: String)-> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("Couldn't find \(filename) in main bundle")
    }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from:data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

// Use an observable object for storage
// To prepare for the user to control which particular landmarks are vaforites, you'll first store the landmark data in an observable object. OBSERVABLE OBJECT is where the data is stored

//  An observable object is a custom object for your data that can be bound to a view from storage in swiftUI's environment. SwiftUI watches for any changes to observable objects that could affect a view, and displays the correct version of the view after a change
