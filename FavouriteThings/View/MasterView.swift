//
//  MasterView.swift
//  FavouriteThings
//
//  Created by mac on 3/5/20.
//  Copyright © 2020 Wendy Yu. All rights reserved.
//

import Foundation
import SwiftUI

// MasterView show cat image,type and name
struct MasterView: View {
    @ObservedObject var catList: CatList
    @Environment(\.editMode) var mode
    var body: some View {
        VStack {
            if mode?.wrappedValue == .active {
                HStack {
                    TextField("Enter Title", text: $catList.title).font(Font.system(.largeTitle).bold())
                }
            }
           
            List {
                ForEach(catList.cat) { i in  // This loop through all the cat list
                    NavigationLink (destination: DetailView(cat: i)){
                            RowView(catRow: i)
                    }
                // onDelete to delete the specific itms
                }.onDelete {indices in indices.forEach { self.catList.cat.remove(at: $0) }}
                .onMove(perform: move)  // onMove is to rearrange the position
            }
        }.navigationBarTitle(mode?.wrappedValue == .active ?  "" : catList.title)
    }
    
    // To rearrange any item in the list
    func move (from source: IndexSet, to destination: Int){
        catList.cat.move(fromOffsets: source, toOffset: destination)
        
    }
}
