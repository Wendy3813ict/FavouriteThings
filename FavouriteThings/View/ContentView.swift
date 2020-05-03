//
//  ContentView.swift
//  FavouriteThings
//
//  Created by mac on 24/4/20.
//  Copyright © 2020 Wendy Yu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var catList: CatList
    var body: some View{
        NavigationView{
            MasterView(catList:catList)
            .navigationBarTitle("FavoriteThings")
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(catList: CatList())
    }
}
