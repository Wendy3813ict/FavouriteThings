//
//  Cat.swift
//  FavouriteThings
//
//  Created by mac on 26/4/20.
//  Copyright © 2020 Wendy Yu. All rights reserved.
//

import Foundation
import SwiftUI


// This class represent particular thing in the favourite.
class Cat: ObservableObject, Identifiable, Codable {

// String for url to download image.
    @Published var url: String?
    var image: Image {
        if let img = url {
    // through the Image.swift, download the image from the url
            return downloadedImage(img)
        }
        else {
            return Image("default")  // If image can't downloaded, it will return the default image.
        }
    }
    
    @Published var type: String             // String containing the cat type
    @Published var name: String             // String containing the cat name
    @Published var breed: String            // String containing the cat breed
    @Published var character: String        // String containing the cat character
    @Published var lifetime: String         // String containing the cat lifetime
    @Published var notes: String            // String containing the cat notes
    @Published var title_field1: String     // String containing the text_field1  of the cat
    @Published var title_field2: String     // String containing the text_field2  of the cat
    

    // JSON encoding and decoding keys
    enum CodingKeys : String, CodingKey {
        case url
        case type
        case name
        case breed
        case character
        case lifetime
        case notes
        case title_field1
        case title_field2
    }
    
    // Initial value of the cat class
    // catURL: cat image url
    // catType: particular type of cat
    // catName: cat name
    // catBreed: cat breed
    // catCharacter: cat character
    // catLifetime: lifetime of cat
    // catNotes: cat notes
    // catTitle_Field1: cat title field 1
    // catTitle_Field2: cat title field 2
    init(_ catURL: String, _ catType:String, _ catName:String, _ catBreed:String, _ catCharacter:String, _ catLifetime:String, _ catNotes:String, _ catTitle_Field1: String,_ catTitle_Field2: String){
        url = catURL
        type = catType
        name = catName
        breed = catBreed
        character = catCharacter
        lifetime = catLifetime
        notes = catNotes
        title_field1 = catTitle_Field1
        title_field2 = catTitle_Field2
    }

    // Decoding data (decoder used for decode data)
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.url = try container.decode(String.self, forKey: .url)
        self.type = try container.decode(String.self, forKey: .type)
        self.name = try container.decode(String.self, forKey: .name)
        self.breed = try container.decode(String.self, forKey: .breed)
        self.character = try container.decode(String.self, forKey: .character)
        self.lifetime = try container.decode(String.self, forKey: .lifetime)
        self.notes = try container.decode(String.self, forKey: .notes)
        self.title_field1 = try container.decode(String.self, forKey: .title_field1)
        self.title_field2 = try container.decode(String.self, forKey: .title_field2)
    }
    
    // Encoding data (encoder used for encode data)
    func encode (to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(url, forKey: .url)
        try container.encode(type, forKey: .type)
        try container.encode(name, forKey: .name)
        try container.encode(breed, forKey: .breed)
        try container.encode(character, forKey: .character)
        try container.encode(lifetime, forKey: .lifetime)
        try container.encode(notes, forKey: .notes)
        try container.encode(title_field1, forKey: .title_field1)
        try container.encode(title_field2, forKey: .title_field2)
    }
}
