//
//  RowView.swift
//  FavouriteThings
//
//  Created by mac on 3/5/20.
//  Copyright © 2020 Wendy Yu. All rights reserved.
//

import Foundation
import SwiftUI

// RowView is a part of MasterView, it shows image, name and type of each cat in the list
struct RowView: View {
    @ObservedObject var catRow: Cat
    var body: some View {
        HStack {
            (catRow.image).resizable().frame(width: 100, height: 100)    //  shows the cat image
            Text(self.catRow.type).bold()                                //  shows the cat type
            Text(self.catRow.name)                                   //  shows the cat name
        }
    }
}
