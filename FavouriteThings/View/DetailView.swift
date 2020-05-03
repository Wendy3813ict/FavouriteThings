//
//  DetailView.swift
//  FavouriteThings
//
//  Created by mac on 3/5/20.
//  Copyright © 2020 Wendy Yu. All rights reserved.
//

import Foundation
import SwiftUI

//showing the details of cats
struct DetailView: View {
    @ObservedObject var cat: Cat
    @Environment(\.managedObjectContext) var viewContext
    @State tempImageURL: String = ""      // tempImageURL is a temporary variable to save user image url
    var body: some View {
        VStack(){
            VStack(alignment: .leading){
                Text("Notes:")
                    .fontWeight(.bold)
                    .font(Font.system(size: 30))
                TextField("Plz enter notes here...",text: $cat.notes)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.frame(width: 300, height: nil)
            
            VStack(alignment: .leading) {
                Text("Image URL:")
                    .fontWeight(.bold)
                    .font(Font.system(size: 20))
                TextField("Enter image URL here", text: $tempImageURL, onCommit: { self.cat.url = self.tempImageURL
                    }).textFieldStyle(RoundedBorderTextFieldStyle())
                           
                           // (cat.image) shows the each image of cat
                (cat.image).resizable().frame(width: 360, height: 300)
            }.frame(width: 350, height: nil)
                
            // show the name and type of cat
            VStack(){
                           
                TextField("Cat type...", text: $cat.type)
                    .font(.largeTitle)
                           
                TextField("Name...", text: $cat.name)
                    .font(.subheadline)
                    .padding(.bottom)
                               
                    }.frame(width: 300, alignment: .leading)
            
             VStack(){
                // Show the title and value of the cat (these two fields can edit)
                HStack {
                    TextField("Breed..", text: $cat.title_field1)
                    TextField("Enter breed...", text: $cat.breed)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                            
                HStack {
                    TextField("Lifetime..", text: $cat.title_field2)
                    TextField("Enter cat lifetime...", text: $cat.lifetime)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
        }
    }
}
