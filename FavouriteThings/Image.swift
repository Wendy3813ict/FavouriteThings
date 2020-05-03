//
//  Image.swift
//  FavouriteThings
//
//  Created by mac on 3/5/20.
//  Copyright © 2020 Wendy Yu. All rights reserved.
//

import Foundation
import SwiftUI

// return image to downloadedImage
func downloadedImage (_ img: String)-> Image {

    //  Check the url link is correct or not, if wrong url link will retrun the default image.
    guard let imageURL = URL(string: img )
        else {
            return (Image("default"))
    }

    guard let imageData = try? Data(contentsOf: imageURL)
        else {
            print("Unsuccessful image download")
            return (Image("default"))
    }

    guard let uiImage = UIImage(data: imageData) else {
            print("Data not include image")
            return (Image("default"))
    }

    // UIImage data will transfer Image and stored in the downloadedImage.
    let downloadedImage = Image(uiImage: uiImage)
    
    // Return to the downloaded image
    return downloadedImage
}
