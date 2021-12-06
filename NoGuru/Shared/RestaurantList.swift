//
//  RestaurantList.swift
//  NoGuru
//
//  Created by Fernando Daniel Mateo Ramos on 24/11/21.
//

import SwiftUI

struct RestaurantList: View {
    @ViewBuilder
    var body: some View {
        #if os(iOS)
        content
            .listStyle(InsetGroupedListStyle())
        #else
        content
            .frame(minWidth:800, minHeight: 600)
            .toolbar {
                ToolbarItem(placement: .automatic){
                    Button(action: {}) {
                        Image(systemName: "person.crop.circle")
                    }
                }
            }
        #endif
    }
    var content: some View {
        List(0 ..< 20) { item in
            RestaurantRow()
        }
        .navigationTitle("Restaurantes")
    }
}

struct RestaurantList_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantList()
    }
}
