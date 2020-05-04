//
//  ContentView.swift
//  FavouriteThings
//
//  Created by mac on 3/5/20.
//  Copyright © 2020 Wendy Yu. All rights reserved.
//

import SwiftUI

    // ContentView to display the MasterView
struct ContentView: View {
    @ObservedObject var catList = CatList()
    var body: some View {
       NavigationView {
        MasterView(catList: catList)
           
            /*  leading: EditButton() - specifies the edit button in the navigation bar on the left side
                trailing: Button(action) - specifies the add button in the navigation bar on the right side
                If the user clicks on add button, then it appends the ground array to add a new ground entry which is specified
                in action. */
            .navigationBarItems(leading: EditButton(),
            trailing: Button( action: {
                  withAnimation { self.catList.cat.append(Cat("","Type", "Name","","","","", "", "")) }
            }){ Image(systemName: "plus")})
        }
    }
}
