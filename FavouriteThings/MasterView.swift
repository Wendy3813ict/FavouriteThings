//
//  MasterView.swift
//  FavouriteThings
//
//  Created by mac on 26/4/20.
//  Copyright © 2020 Wendy Yu. All rights reserved.
//

import SwiftUI

struct MasterView: View {
    @State var catList: CatList
    
    var body: some View {
        NavigationView{
            List{
                
                    ForEach(0..<catList.cats.count){i in
                        NavigationLink (destination: DetailView(cat:        // when click the pet, it will show related informaion (means to will retun to DetailView)
                            self.catList.cats[i])){
                                HStack{
                                    Image("\(self.catList.cats[i].breed)")
                                        .resizable().frame(width: 70, height: 70)
                                    Text("\(self.catList.cats[i].type)").bold()
                                    Text("\(self.catList.cats[i].name)")
                                }
                        }
                    }
                        
                        .onDelete(perform:delete)
//                        .onMove(perform:move)
            }
                        // add edit button
                        .navigationBarItems(leading: EditButton())
                           
                    }
                }
    
//    private var addButton: some View{
//        switch CatList {
//        case .inactive:
//            return AnyView(Button(action: onAdd){Image(systemName: "plus")})
//        default:
//            return AnyView(EmptyView())
//        }
//    }
    
            
                func delete(at offsets: IndexSet){
//                    print("cat")
//                    if let first = offsets.first{
//                        catList.remove(at: first)
                    self.catList.cats.remove(atOffsets: offsets)
                    print(catList.cats)

//                    }
//                  }
//                func move(from source: IndexSet, to destination: Int){
//                    let reversedSource = source.sorted()
//                    for index in reversedSource.reversed(){
//                        catList.insert(catList.remove(at: index), at: destination)
//                        }
//                    }
//                func add(){
//                    let maxID = catList.map($0.id).max() + 1
//                    let cat = CatList(id: maxID, breed: "new breed")
//                }
//                }
//            }

                    }
                }
