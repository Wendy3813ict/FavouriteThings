//
//  ViewModel.swift
//  FavouriteThings
//
//  Created by mac on 3/5/20.
//  Copyright © 2020 Wendy Yu. All rights reserved.
//

import Foundation
import SwiftUI

class CatList: ObservableObject, Identifiable, Codable {
    @Published var cat:  [Cat]
    @Published var title: String

    // JSON encoding and decoding keys
    enum CodingKeys : String, CodingKey {
        case cat
        case title
    }

// inital class of CatList
    init() {
        cat = [Cat("https://www.google.com/imgres?imgurl=https%3A%2F%2Fvetstreet.brightspotcdn.com%2Fdims4%2Fdefault%2Fd6b5fd9%2F2147483647%2Fcrop%2F0x0%252B0%252B0%2Fresize%2F645x380%2Fquality%2F90%2F%3Furl%3Dhttps%253A%252F%252Fvetstreet-brightspot.s3.amazonaws.com%252Fbf%252Ffcaf70a33411e087a80050568d634f%252Ffile%252FRagdoll-4-645mk062211.jpg&imgrefurl=http%3A%2F%2Fwww.vetstreet.com%2Fcats%2Fragdoll&tbnid=aZFlKNwT75Q-PM&vet=12ahUKEwiIo9TEkpfpAhWbB7cAHS2rCJIQMygCegUIARDSAQ..i&docid=tsmYft0APiXMkM&w=645&h=380&q=ragdoll&ved=2ahUKEwiIo9TEkpfpAhWbB7cAHS2rCJIQMygCegUIARDSAQ","PET","Cat", "Ragdoll", "docile", "15-20", "Ragdoll lovers", "Breed", "lifetime"), Cat("https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdn1-www.cattime.com%2Fassets%2Fuploads%2F2011%2F12%2Ffile_2744_british-shorthair-460x290-460x290.jpg&imgrefurl=https%3A%2F%2Fcattime.com%2Fcat-breeds%2Fbritish-shorthair-cats&tbnid=zF5WWCBo1yBsTM&vet=12ahUKEwjbybmBmZfpAhXTieYKHbScANYQMygAegUIARDQAQ..i&docid=jl5_XOIGihCYFM&w=460&h=290&q=British%20shorthair&ved=2ahUKEwjbybmBmZfpAhXTieYKHbScANYQMygAegUIARDQAQ","PET","Cat", "British shorthair", "docile", "15-20", "British shorthair lovers", "Breed", "lifetime"),
            Cat("https://www.google.com/imgres?imgurl=https%3A%2F%2Ficatcare.org%2Fapp%2Fuploads%2F2018%2F09%2FAmerican-bobtail.png&imgrefurl=https%3A%2F%2Ficatcare.org%2Fadvice%2Famerican-bobtail%2F&tbnid=myQCRItCXKVPhM&vet=12ahUKEwiotYTAmZfpAhUEQ3wKHeNTA7oQMygAegUIARDPAQ..i&docid=gf7FtuXpl2Q3xM&w=1200&h=600&q=American%20Botail&ved=2ahUKEwiotYTAmZfpAhUEQ3wKHeNTA7oQMygAegUIARDPAQ","PET","Cat", "American Botail", "docile", "15-20", "American Botail lovers", "Breed", "lifetime")]
        title = "Favourite Cat"
    }

// Decoding data
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cat = try container.decode([Cat].self, forKey: .cat)
        self.title = try container.decode(String.self, forKey: .title)
    }
    
    // Encoding data
    func encode (to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(cat, forKey: .cat)
        try container.encode(title, forKey: .title)
    }

}
